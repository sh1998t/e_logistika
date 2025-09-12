// import 'package:injectable/injectable.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';
// import '../../../../core/constants/app_constants.dart';
// import '../models/user_model.dart';
//
// abstract class AuthLocalDataSource {
//   Future<UserModel?> getCachedUser();
//   Future<void> cacheUser(UserModel user);
//   Future<AuthTokensModel?> getCachedTokens();
//   Future<void> cacheTokens(AuthTokensModel tokens);
//   Future<void> clearUserData();
// }
//
// @Singleton(as: AuthLocalDataSource)
// class AuthLocalDataSourceImpl implements AuthLocalDataSource {
//   final SharedPreferences sharedPreferences;
//
//   AuthLocalDataSourceImpl(this.sharedPreferences);
//
//   @override
//   Future<UserModel?> getCachedUser() async {
//     final userJson = sharedPreferences.getString(AppConstants.userKey);
//     if (userJson != null) {
//       return UserModel.fromJson(json.decode(userJson));
//     }
//     return null;
//   }
//
//   @override
//   Future<void> cacheUser(UserModel user) async {
//     await sharedPreferences.setString(
//       AppConstants.userKey,
//       json.encode(user.toJson()),
//     );
//   }
//
//   @override
//   Future<AuthTokensModel?> getCachedTokens() async {
//     final tokensJson = sharedPreferences.getString(AppConstants.tokenKey);
//     if (tokensJson != null) {
//       return AuthTokensModel.fromJson(json.decode(tokensJson));
//     }
//     return null;
//   }
//
//   @override
//   Future<void> cacheTokens(AuthTokensModel tokens) async {
//     await sharedPreferences.setString(
//       AppConstants.tokenKey,
//       json.encode(tokens.toJson()),
//     );
//   }
//
//   @override
//   Future<void> clearUserData() async {
//     await sharedPreferences.remove(AppConstants.userKey);
//     await sharedPreferences.remove(AppConstants.tokenKey);
//     await sharedPreferences.remove(AppConstants.refreshTokenKey);
//   }
// }
