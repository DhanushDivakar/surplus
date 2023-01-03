import 'dart:io';

import 'package:surplus/models/jsonresponse.dart';
import 'package:surplus/services/auth_service.dart';

import '../models/user_model.dart';


abstract class AuthRepository {
  Future<JsonResponse> sendOTP(String phone);
  Future<JsonResponse> verifOtp(String phone, String otp);
  Future<JsonResponse> register(
     User user);
}

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({required this.authService});
  final AuthService authService;
  @override
  Future<JsonResponse> register(
     User user) {
    return authService.register(user
       );
  }

  @override
  Future<JsonResponse> sendOTP(String phone) {
    return authService.sendOTP(phone);
  }

  @override
  Future<JsonResponse> verifOtp(String phone, String otp) {
    return authService.verifyOTP(phone, otp);
  }
}
