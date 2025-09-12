import 'package:injectable/injectable.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

@singleton
class NetworkInfoImpl implements NetworkInfo {
  @override
  Future<bool> get isConnected async {
    // You can implement actual network connectivity check here
    // For now, we'll assume we're always connected
    return true;
  }
}

