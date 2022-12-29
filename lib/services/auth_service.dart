import 'package:dio/dio.dart';
import 'package:surplus/models/jsonresponse.dart';
import 'package:surplus/utlis/constants.dart';

import '../models/user_model.dart';

class AuthService {
  AuthService({required this.dio}) {
    print('$url url');
    dio.options.baseUrl = url;
  }
  final Dio dio;

  final baseUrl = 'http://192.168.43.179:3000';

  Future<JsonResponse> sendOTP(String phone) async {
    try {
      final response = await dio.post(sendOtp, data: {
        'phone': phone,
      });
      print(response.data + response.statusCode);
      if (response.statusCode == 200) {
        print('Sucess');
        return JsonResponse.success(
            message: 'Otp send successfully', data: response.data);
      } else {
        print('Failure');
        print(response.statusCode);
        return JsonResponse.failure(
            statusCode: response.statusCode ?? 500,
            message: 'something went wrong');
      }
    } on DioError catch (error) {
      print(error.message);
      return JsonResponse.failure(message: 'Dio error');
    } on Exception catch (e) {
      print(e);
      return JsonResponse.failure(
        message: 'Unxpected error',
      );
    }
  }

  Future<JsonResponse> verifyOTP(String phone, String otp) async {
    try {
      final response = await dio.post(validateOTP, data: {
        'phone': phone,
        'otp': otp,
      });
      if (response.statusCode == 200) {
        print(response.data);
        return JsonResponse.success(
            message: 'Otp verified successfully', data: response.data);
      } else {
        return JsonResponse.failure(
          message: 'something went wrong',
          statusCode: response.statusCode ?? 500,
        );
      }
    } catch (error) {
      print(error);
      return JsonResponse.failure(
        message: 'something went wrong',
      );
    }
  }

  Future<JsonResponse> register(User user) async {
    try {
      final formData = FormData.fromMap(user.toJson());
      print('fiels: ${formData.files} ${formData.fields}');
      final response = await dio.post(registerUser, data: formData);
      if (response.statusCode == 200) {
        //final user = User.fromJson(response.data)
        return JsonResponse.success(
          message: 'Registered successfully',
          data: response.data,
        );
      } else {
        print('${response.data} ${response.statusCode}');
        return JsonResponse.failure(
          message: 'something went wrong',
        );
      }
    } catch (error) {
      print(error);
      return JsonResponse.failure(
        message: 'error',
      );
    }
  }
}
