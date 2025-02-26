import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';

import '../../models/api_error_respond_model/api_error_respond_model.dart';
import '../../models/auth/login_model.dart';
import '../../models/auth/register_model.dart';
import '../../models/auth/auth_respond_model.dart';
import '../../service/api/api_controller.dart';
import '../../service/api/api_helper.dart';
import '../../util/manage_token.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthRespondModel? profile;

  AuthCubit() : super(AuthInitial());

  void isInit() => emit(AuthInitial());

  void isIdle() => emit(AuthIdle());

  void postLogin({required String credential, required String password}) async {
    if (credential.isEmpty) {
      emit(
        LoginError(
          respond: ApiErrorRespondModel(
            status: 'Failed',
            message: 'Credentials empty',
          ),
        ),
      );
      return;
    }
    if (password.length < 8) {
      emit(
        LoginError(
          respond: ApiErrorRespondModel(
            status: 'Failed',
            message: 'Password less than 8',
          ),
        ),
      );
      return;
    }
    emit(AuthLoading());
    final loginModel = LoginModel(
      credential: credential,
      password: password,
    );
    final respond = await ApiHelper.login(loginModel);
    if (respond is AuthRespondModel) {
      profile = respond;
      ApiController.token = respond.token;
      ManageToken.writeToken();
      emit(LoginSuccess(respond: respond));
      return;
    }
    if (respond is ApiErrorRespondModel) {
      emit(LoginError(respond: respond));
      return;
    }
  }

  void postRegister({
    XFile? avatar,
    required String fullname,
    required String username,
    required String password,
    required String passwordConfirmation,
    required String email,
    required String phoneNumber,
  }) async {
    if (fullname.isEmpty ||
        username.isEmpty ||
        password.isEmpty ||
        passwordConfirmation.isEmpty ||
        email.isEmpty ||
        phoneNumber.isEmpty) {
      emit(
        RegisterError(
          respond: ApiErrorRespondModel(
            status: 'Failed',
            message: 'Fill all required data',
          ),
        ),
      );
      return;
    }
    if (password.length < 8) {
      emit(
        RegisterError(
          respond: ApiErrorRespondModel(
            status: 'Failed',
            message: 'Password should be at least 8 character',
          ),
        ),
      );
      return;
    }
    if (passwordConfirmation != password) {
      emit(
        RegisterError(
          respond: ApiErrorRespondModel(
            status: 'Failed',
            message: 'Confirm password',
          ),
        ),
      );
      return;
    }
    if (!EmailValidator.validate(email)) {
      emit(
        RegisterError(
          respond: ApiErrorRespondModel(
            status: 'Failed',
            message: 'Email invalid',
          ),
        ),
      );
      return;
    }
    final phone = PhoneNumber.parse(phoneNumber, callerCountry: IsoCode.ID);
    if (!phone.isValid(type: PhoneNumberType.mobile)) {
      emit(
        RegisterError(
          respond: ApiErrorRespondModel(
            status: 'Failed',
            message: 'Phone number not valid',
          ),
        ),
      );
      return;
    }
    emit(AuthLoading());
    MultipartFile? image;
    if (avatar != null) {
      image = await MultipartFile.fromFile(
        avatar.path,
        filename: avatar.name.split('/').last,
      );
    }
    final registerModel = RegisterModel(
      avatar: image,
      fullname: fullname,
      username: username,
      password: password,
      passwordConfirmation: passwordConfirmation,
      email: email,
      phoneNumber: phoneNumber,
    );
    final formData = FormData.fromMap(registerModel.toMap());
    final respond = await ApiHelper.register(formData);
    if (respond is AuthRespondModel) {
      profile = respond;
      ApiController.token = respond.token;
      ManageToken.writeToken();
      emit(RegisterSuccess(respond: respond));
      return;
    }
    if (respond is ApiErrorRespondModel) {
      emit(RegisterError(respond: respond));
      return;
    }
  }

  void postLogout() async {
    emit(AuthLoading());
    final respond = await ApiHelper.logout();
    if (respond is ApiErrorRespondModel) {
      emit(LogoutError(respond: respond));
      return;
    } else {
      ManageToken.deleteToken();
      emit(LogoutSuccess());
    }
  }

  void getProfile() async {
    if (ApiController.token.toString().isEmpty) {
      emit(
        ProfileError(
          respond: ApiErrorRespondModel(
            status: 'Failed',
            message: 'Unauthenticated',
          ),
        ),
      );
      return;
    }
    emit(AuthLoading());
    final respond = await ApiHelper.getProfile();
    if (respond is AuthRespondModel) {
      profile = respond;
      emit(ProfileSuccess(respond: respond));
      return;
    }
    if (respond is ApiErrorRespondModel) {
      emit(ProfileError(respond: respond));
      return;
    }
  }

  void editProfile({
    XFile? avatar,
    String? username,
    String? email,
    String? phoneNumber,
  }) async {
    if (ApiController.token.toString().isEmpty) {
      emit(
        ProfileError(
          respond: ApiErrorRespondModel(
            status: 'Failed',
            message: 'Unauthenticated',
          ),
        ),
      );
      return;
    }
    emit(AuthLoading());
    MultipartFile? image;
    if (avatar != null) {
      image = await MultipartFile.fromFile(
        avatar.path,
        filename: avatar.name.split('/').last,
      );
    }
    final request = FormData.fromMap({
      'avatar': image,
      'username': username,
      'email': email,
      'phone_number': phoneNumber,
    });
    final respond = await ApiHelper.editProfile(request);
    if (respond is AuthRespondModel) {
      profile = respond;
      emit(ProfileSuccess(respond: respond));
      return;
    }
    if (respond is ApiErrorRespondModel) {
      emit(ProfileError(respond: respond));
      return;
    }
  }
}
