import 'package:dio/dio.dart';
import 'package:surplus/utlis/constants.dart';

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
    } on DioError catch (error) {
      print(error.message);
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

  Future register()async {
    // try{

    // }
  }
}
