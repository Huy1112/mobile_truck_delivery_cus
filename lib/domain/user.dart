import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class FormData {
  String? phone;
  String? password;

  FormData({
    this.phone,
    this.password,
  });

  factory FormData.fromJson(Map<String, dynamic> json) =>
      _$FormDataFromJson(json);

  Map<String, dynamic> toJson() => _$FormDataToJson(this);
}


FormData _$FormDataFromJson(Map<String, dynamic> json) {
  return FormData(
    phone: json['userPhone'] as String?,
    password: json['password'] as String?,
  );
}

Map<String, dynamic> _$FormDataToJson(FormData instance) => <String, dynamic>{
  'userPhone': instance.phone,
  'userPassword': instance.password,
};
