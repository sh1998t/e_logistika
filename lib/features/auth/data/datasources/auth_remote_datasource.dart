// import 'package:dio/dio.dart';
// import 'package:injectable/injectable.dart';
// import 'package:retrofit/retrofit.dart';
// import '../../../../core/constants/api_constants.dart';
// import '../../../../core/network/dio_client.dart';
// import '../models/auth_response.dart';
// import '../models/login_request.dart';
// import '../models/register_request.dart';
//
// part 'auth_remote_datasource.g.dart';
//
// @RestApi()
// @Singleton()
// abstract class AuthRemoteDataSource {
//   @factoryMethod
//   factory AuthRemoteDataSource(Dio dio) = _AuthRemoteDataSource;
//
//   @POST(ApiConstants.loginEndpoint)
//   Future<AuthResponse> login(@Body() LoginRequest request);
//
//   @POST(ApiConstants.registerEndpoint)
//   Future<AuthResponse> register(@Body() RegisterRequest request);
//
//   @POST(ApiConstants.refreshTokenEndpoint)
//   Future<AuthResponse> refreshToken(@Body() Map<String, String> request);
//
//   @POST(ApiConstants.logoutEndpoint)
//   Future<void> logout();
// }