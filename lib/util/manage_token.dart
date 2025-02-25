import '../service/api/api_controller.dart';
import 'secure_storage.dart';

class ManageToken {
  static const key = 'authToken';

  static void readToken() async {
    await SecureStorage()
        .readSecureData(key: key)
        .then((val) => ApiController.token = val);
  }

  static void writeToken() async {
    ApiController.token != null
        ? await SecureStorage()
            .writeSecureData(key: key, value: ApiController.token!)
        : null;
  }

  static void deleteToken() async {
    await SecureStorage()
        .deleteSecureData(key: key)
        .then((val) => ApiController.token = null);
  }
}
