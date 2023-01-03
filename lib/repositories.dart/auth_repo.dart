import 'dart:io';

import 'package:surplus/models/jsonresponse.dart';
import 'package:surplus/services/auth_service.dart';


abstract class AuthRepository {
  Future<JsonResponse> sendOTP(String phone);
  Future<JsonResponse> verifOtp(String phone, String otp);
  Future<JsonResponse> register(
      String name,
      String phone,
      String email,
      File profilePic,
      File aadharPic,
      String aadharNo,
      String lat,
      String long);
}

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({required this.authService});
  final AuthService authService;
  @override
  Future<JsonResponse> register(
      String name,
      String phone,
      String email,
      File profilePic,
      File aadharPic,
      String aadharNo,
      String lat,
      String long) {
    return authService.register(
        name, phone, email, profilePic, aadharPic, aadharNo, lat, long);
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
