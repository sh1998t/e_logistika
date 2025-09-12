import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../constants/app_constants.dart';

@Singleton()
class AppPreference {
  AppPreference(this._prefs);

  final FlutterSecureStorage _prefs;

  Future<String?> get accessToken => _prefs.read(key: AppConstants.token);
  Future<bool> get initialRoute async =>
      await _prefs.containsKey(key: AppConstants.initialPath);
  Future<bool> get hasToken => _prefs.containsKey(key: AppConstants.token);

  Future setAccessToken(String? token) async {
    if (token == null) {
      return await _prefs.delete(key: AppConstants.token);
    }

    return await _prefs.write(value: token, key: AppConstants.token);
  }

  Future<String?> get refreshToken async =>
      await _prefs.read(key: AppConstants.refreshToken);

  Future setRefreshToken(String? token) async {
    if (token == null) {
      return await _prefs.delete(key: AppConstants.refreshToken);
    }

    return await _prefs.write(key: AppConstants.refreshToken, value: token);
  }

  Future deleteToken() async {
    await _prefs.delete(key: AppConstants.token);
    await _prefs.delete(key: AppConstants.refreshToken);
    await _prefs.delete(key: AppConstants.initialPath);
  }

  Future enteredOnboarding() async =>
      await _prefs.write(key: AppConstants.initialPath, value: 'entered');
}
