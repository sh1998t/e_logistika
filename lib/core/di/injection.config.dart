// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:e_logistika/core/di/injection.dart' as _i653;
import 'package:e_logistika/core/network/dio_client.dart' as _i316;
import 'package:e_logistika/core/network/network_info.dart' as _i151;
import 'package:e_logistika/core/utils/app_preference.dart' as _i958;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i316.DioClient>(() => _i316.DioClient());
    gh.singleton<_i151.NetworkInfoImpl>(() => _i151.NetworkInfoImpl());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => registerModule.secureStorage,
    );
    gh.singleton<_i958.AppPreference>(
      () => _i958.AppPreference(gh<_i558.FlutterSecureStorage>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i653.RegisterModule {}
