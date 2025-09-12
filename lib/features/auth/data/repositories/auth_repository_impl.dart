// import 'package:dartz/dartz.dart';
// import 'package:injectable/injectable.dart';
// import '../../../../core/errors/exceptions.dart';
// import '../../../../core/errors/failures.dart';
// import '../../../../core/network/network_info.dart';
// import '../../domain/entities/user.dart';
// import '../../domain/entities/auth_tokens.dart';
// import '../../domain/repositories/auth_repository.dart';
// import '../datasources/auth_local_datasource.dart';
// import '../datasources/auth_remote_datasource.dart';
// import '../models/login_request.dart';
// import '../models/register_request.dart';
//
// @Singleton(as: AuthRepository)
// class AuthRepositoryImpl implements AuthRepository {
//   final AuthRemoteDataSource remoteDataSource;
//   final AuthLocalDataSource localDataSource;
//   final NetworkInfo networkInfo;
//
//   AuthRepositoryImpl({
//     required this.remoteDataSource,
//     required this.localDataSource,
//     required this.networkInfo,
//   });
//
//   @override
//   Future<Either<Failure, User>> login({
//     required String email,
//     required String password,
//     bool rememberMe = false,
//   }) async {
//     if (await networkInfo.isConnected) {
//       try {
//         final request = LoginRequest(
//           email: email,
//           password: password,
//           rememberMe: rememberMe,
//         );
//
//         final response = await remoteDataSource.login(request);
//
//         // Cache user and tokens
//         await localDataSource.cacheUser(response.user);
//         await localDataSource.cacheTokens(response.tokens);
//
//         return Right(response.user);
//       } on ServerException catch (e) {
//         return Left(ServerFailure(message: e.message, code: e.code));
//       } on NetworkException catch (e) {
//         return Left(NetworkFailure(message: e.message));
//       } catch (e) {
//         return Left(UnknownFailure(message: e.toString()));
//       }
//     } else {
//       return const Left(NetworkFailure(message: 'No internet connection'));
//     }
//   }
//
//   @override
//   Future<Either<Failure, User>> register({
//     required String email,
//     required String username,
//     required String password,
//     required String confirmPassword,
//     String? firstName,
//     String? lastName,
//     String? phone,
//   }) async {
//     if (await networkInfo.isConnected) {
//       try {
//         final request = RegisterRequest(
//           email: email,
//           username: username,
//           password: password,
//           confirmPassword: confirmPassword,
//           firstName: firstName,
//           lastName: lastName,
//           phone: phone,
//         );
//
//         final response = await remoteDataSource.register(request);
//
//         // Cache user and tokens
//         await localDataSource.cacheUser(response.user);
//         await localDataSource.cacheTokens(response.tokens);
//
//         return Right(response.user);
//       } on ServerException catch (e) {
//         return Left(ServerFailure(message: e.message, code: e.code));
//       } on NetworkException catch (e) {
//         return Left(NetworkFailure(message: e.message));
//       } catch (e) {
//         return Left(UnknownFailure(message: e.toString()));
//       }
//     } else {
//       return const Left(NetworkFailure(message: 'No internet connection'));
//     }
//   }
//
//   @override
//   Future<Either<Failure, AuthTokens>> refreshToken(String refreshToken) async {
//     if (await networkInfo.isConnected) {
//       try {
//         final response = await remoteDataSource.refreshToken({
//           'refresh_token': refreshToken,
//         });
//
//         await localDataSource.cacheTokens(response.tokens);
//
//         return Right(response.tokens);
//       } on ServerException catch (e) {
//         return Left(ServerFailure(message: e.message, code: e.code));
//       } on NetworkException catch (e) {
//         return Left(NetworkFailure(message: e.message));
//       } catch (e) {
//         return Left(UnknownFailure(message: e.toString()));
//       }
//     } else {
//       return const Left(NetworkFailure(message: 'No internet connection'));
//     }
//   }
//
//   @override
//   Future<Either<Failure, void>> logout() async {
//     try {
//       if (await networkInfo.isConnected) {
//         await remoteDataSource.logout();
//       }
//       await localDataSource.clearUserData();
//       return const Right(null);
//     } catch (e) {
//       return Left(UnknownFailure(message: e.toString()));
//     }
//   }
//
//   @override
//   Future<Either<Failure, User?>> getCurrentUser() async {
//     try {
//       final user = await localDataSource.getCachedUser();
//       return Right(user);
//     } catch (e) {
//       return Left(CacheFailure(message: e.toString()));
//     }
//   }
//
//   @override
//   Future<Either<Failure, void>> saveUser(User user) async {
//     try {
//       await localDataSource.cacheUser(user as dynamic);
//       return const Right(null);
//     } catch (e) {
//       return Left(CacheFailure(message: e.toString()));
//     }
//   }
//
//   @override
//   Future<Either<Failure, void>> saveTokens(AuthTokens tokens) async {
//     try {
//       await localDataSource.cacheTokens(tokens as dynamic);
//       return const Right(null);
//     } catch (e) {
//       return Left(CacheFailure(message: e.toString()));
//     }
//   }
//
//   @override
//   Future<Either<Failure, AuthTokens?>> getTokens() async {
//     try {
//       final tokens = await localDataSource.getCachedTokens();
//       return Right(tokens);
//     } catch (e) {
//       return Left(CacheFailure(message: e.toString()));
//     }
//   }
//
//   @override
//   Future<Either<Failure, void>> clearUserData() async {
//     try {
//       await localDataSource.clearUserData();
//       return const Right(null);
//     } catch (e) {
//       return Left(CacheFailure(message: e.toString()));
//     }
//   }
// }
