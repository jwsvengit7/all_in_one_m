import 'dart:convert';


import 'package:all_in_one_m/config/url_config.dart';
import 'package:all_in_one_m/user/model/request/app_request.dart';

import 'package:http/http.dart' as http;

class AuthService {
  Future<http.Response> login({var email, var password}) async {
    print(email);
    print(password);
    try {
      return await http.post(
          Uri.parse("${AppUrl.appUrl}/api/v1/auth/login"),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(AppRequest().login(password, email)));
    } catch (e) {
      throw new Exception(e);
    }
  }
    Future<http.Response> verifyOTP({var email, var otp}) async {
      print(email);
      print(otp);
    try {
      return await http.post(
          Uri.parse("${AppUrl.appUrl}/api/v1/auth/verify-user"),
           headers: {'Content-Type': 'application/json'},
          body: jsonEncode(AppRequest().verifyOTP(otp, email)));
    } catch (e) {
      throw new Exception(e);
    }
  }
      Future<http.Response> resendOtp({var email}) async {
    try {
      return await http.post(
          Uri.parse("${AppUrl.appUrl}/api/v1/auth/resend-otp"),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(AppRequest().resend(email)));
    } catch (e) {
      throw new Exception(e);
    }
  }
        Future<http.Response> forget_password({var email}) async {
    try {
      return await http.post(
          Uri.parse("${AppUrl.appUrl}/api/v1/auth/forgot-password"),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(AppRequest().resend(email)));
    } catch (e) {
      throw new Exception(e);
    }
  }

  Future<http.Response> createAccount(
      {var email,
      var password,
      var phoneNumber,
      var accountType,
      var role}) async {
    print(email);


    try {
      final response = await http.post(
          Uri.parse(
              "${AppUrl.appUrl}/api/v1/auth/register"),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(AppRequest()
              .createAccount(phoneNumber, accountType, password, role, email)));
      print(response);
      return response;
    } catch (e) {
      print(e);
      throw new Exception('Error $e');
    }
  }
}
