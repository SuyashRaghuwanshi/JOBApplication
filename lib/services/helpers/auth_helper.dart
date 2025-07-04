import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as https;
import 'package:jobhub/models/request/auth/login_model.dart';
import 'package:jobhub/models/request/auth/profile_update_model.dart';
import 'package:jobhub/models/request/auth/signup_model.dart';
import 'package:jobhub/models/response/auth/login_res_model.dart';
import 'package:jobhub/models/response/auth/profile_model.dart';
import 'package:jobhub/services/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthHelper {
  // static var client = https.Client();
  // static Future<bool> login(LoginModel model) async {
  //   Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
  //   var url = Uri.https(Config.apiUrl, Config.loginUrl);
  //   try {
  //     var response = await client.post(
  //       url,
  //       headers: requestHeaders,
  //       body: jsonEncode(model),
  //     );
  //     if (response.statusCode == 200) {
  //       final data = loginResponseModelFromJson(response.body);

  //       if (data.id == null) {
  //         log("Missing data in response: $data");
  //         return false;
  //       }
  //       final SharedPreferences prefs = await SharedPreferences.getInstance();
  //       String token = loginResponseModelFromJson(response.body).token;
  //       String userId = loginResponseModelFromJson(response.body).id;
  //       String profile = loginResponseModelFromJson(response.body).profile;

  //       await prefs.setString('token', token);
  //       await prefs.setString('userId', userId);
  //       await prefs.setString('profile', profile);
  //       await prefs.setBool('loggedIn', true);
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } catch (err) {
  //     log("Login Error: $err");
  //     return false;
  //   }
  // }
  static var client = https.Client();
  static Future<bool> login(LoginModel model) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    var url = Uri.https(Config.apiUrl, Config.loginUrl);

    try {
      var response = await client.post(
        url,
        headers: requestHeaders,
        body: jsonEncode(model),
      );

      log("Status Code: ${response.statusCode}");
      log("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final data = loginResponseModelFromJson(response.body);

        if (data.id.isEmpty) {
          log("Missing 'id' in response");
          return false;
        }

        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', data.token);
        await prefs.setString('userId', data.id);
        await prefs.setBool('loggedIn', true);

        return true;
      } else {
        log("Login failed with status: ${response.statusCode}");
        return false;
      }
    } catch (err) {
      log("Login Error: $err");
      return false;
    }
  }

  static Future<bool> signup(SignupModel model) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    var url = Uri.https(Config.apiUrl, Config.signupUrl);
    try {
      var response = await client.post(
        url,
        headers: requestHeaders,
        body: jsonEncode(model),
      );
      log("${response.statusCode}");
      log("${response.body}");
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (err) {
      log("SignUp Error: $err");
      return false;
    }
  }

  static Future<bool> updateProfile(ProfileUpdateReq model) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': 'Bearer $token',
    };
    log("Request Headers: $requestHeaders");
    var url = Uri.https(Config.apiUrl, Config.profileUrl);
    log("$url");
    var response = await client.put(
      url,
      headers: requestHeaders,
      body: jsonEncode(model),
    );
    log("Status: ${response.statusCode}");
    log("Body: ${response.body}");
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<ProfileRes> getProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': 'Bearer $token',
    };
    log("Request Headers: $requestHeaders");
    var url = Uri.https(Config.apiUrl, Config.profileUrl);
    log("$url");
    var response = await client.get(url, headers: requestHeaders);
    log("Status: ${response.statusCode}");
    log("Body: ${response.body}");
    if (response.statusCode == 200) {
      var profile = profileResFromJson(response.body);
      return profile;
    } else {
      throw Exception("Failed to get the profile");
    }
  }
}
