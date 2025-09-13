// // GENERATED CODE - DO NOT MODIFY BY HAND
//
// part of 'register_request.dart';
//
// // **************************************************************************
// // JsonSerializableGenerator
// // **************************************************************************
//
// RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
//     RegisterRequest(
//       email: json['email'] as String,
//       username: json['username'] as String,
//       password: json['password'] as String,
//       confirmPassword: json['confirmPassword'] as String,
//       firstName: json['firstName'] as String?,
//       lastName: json['lastName'] as String?,
//       phone: json['phone'] as String?,
//     );
//
// Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) {
//   final val = <String, dynamic>{
//     'email': instance.email,
//     'username': instance.username,
//     'password': instance.password,
//     'confirmPassword': instance.confirmPassword,
//   };
//
//   void writeNotNull(String key, dynamic value) {
//     if (value != null) {
//       val[key] = value;
//     }
//   }
//
//   writeNotNull('firstName', instance.firstName);
//   writeNotNull('lastName', instance.lastName);
//   writeNotNull('phone', instance.phone);
//   return val;
// }
