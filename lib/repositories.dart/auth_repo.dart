import 'package:surplus/services/auth_service.dart';

import '../models/user_model.dart';

abstract class AuthRepository {
  Future sendOTP(String phone);
  Future verifOtp(String phone, String otp);
  Future register(User user);
}

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({required this.authService});
  final AuthService authService;
  @override
  Future register(User user) {
    return authService.register(user);
  }

  @override
  Future sendOTP(String phone) {
    return authService.sendOTP(phone);
  }

  @override
  Future verifOtp(String phone, String otp) {
    return authService.verifyOTP(phone, otp);
  }
}
