import 'package:dio/dio.dart';
import 'package:surplus/utlis/constants.dart';

import '../models/user_model.dart';

class AuthService {
  AuthService({required this.dio}) {
    print('$url url');
    dio.options.baseUrl = url;
  }
  final Dio dio;

  final baseUrl = 'http://localhost:3000';

  Future sendOTP(String phone) async {
    try {
      final response = await dio.post(sendOtp, data: {
        'phone': phone,
      });
      print(response.data + response.statusCode);
      if (response.statusCode == 200) {
        print('Sucess');
        return response.data;
      } else {
        print('Failure');
        print(response.statusCode);
        return;
      }
    } catch (error) {
      print(error);
    } 
  }

  Future verifyOTP(String phone, String otp) async {
    try {
      final response = await dio.post(validateOTP, data: {
        'phone': phone,
        'otp': otp,
      });
      if (response.statusCode == 200) {
        print(response.data);
        return response.data;
      }
    } catch (error) {
      print(error);
      return;
    }
  }

  Future register(User user) async {
    try {
      final formData = FormData.fromMap(user.toJson());
      print('fiels: ${formData.files} ${formData.fields}');
      final response = await dio.post(registerUser, data: formData);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        print('${response.data} ${response.statusCode}');
        return response.statusCode;
      }
    } catch (error) {
      print(error);
    }
  }
}
