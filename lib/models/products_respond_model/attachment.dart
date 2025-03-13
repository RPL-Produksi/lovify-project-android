import 'dart:convert';

class Attachment {
  String? url;

  Attachment({this.url});

  factory Attachment.fromMap(Map<String, dynamic> data) => Attachment(
        url: data['url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'url': url,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Attachment].
  factory Attachment.fromJson(String data) {
    return Attachment.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Attachment] to a JSON string.
  String toJson() => json.encode(toMap());
}
