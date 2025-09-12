import 'package:equatable/equatable.dart';

class AuthTokens extends Equatable {
  final String accessToken;
  final String refreshToken;
  final int expiresIn;
  final String tokenType;
  
  const AuthTokens({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
    required this.tokenType,
  });
  
  @override
  List<Object> get props => [
    accessToken,
    refreshToken,
    expiresIn,
    tokenType,
  ];
}

