// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore_file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../network/dio_client.dart' as _i4;
import '../network/network_info.dart' as _i5;


extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i4.DioClient>(() => _i4.DioClient());
    gh.singleton<_i5.NetworkInfo>(() => _i5.NetworkInfoImpl());
    // gh.singleton<_i6.AuthLocalDataSource>(() => _i6.AuthLocalDataSourceImpl(gh<_i3.SharedPreferences>()));
    // gh.singleton<_i7.AuthRemoteDataSource>(() => _i7.AuthRemoteDataSource(gh<_i4.DioClient>().dio));
    // gh.singleton<_i8.AuthRepositoryImpl>(() => _i8.AuthRepositoryImpl(
    //       remoteDataSource: gh<_i7.AuthRemoteDataSource>(),
    //       localDataSource: gh<_i6.AuthLocalDataSource>(),
    //       networkInfo: gh<_i5.NetworkInfo>(),
    //     ));

    return this;
  }
}