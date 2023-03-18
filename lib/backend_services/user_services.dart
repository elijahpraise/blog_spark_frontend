import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:blog_spark/backend_services/blog_spark_response.dart';
import 'package:blog_spark/backend_services/config.dart';
import 'package:blog_spark/caching/enviroment_variables.dart';
import 'package:blog_spark/caching/user_shared_preferences.dart';
import 'package:blog_spark/models/user.dart';
import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class UserServices {
  const UserServices({required this.user});
  final User user;

  static BlogSparkConfig _config = BlogSparkConfig();

  tryExcept(
      {required BlogSparkResponse response,
      required void Function() function}) {
    try {
      function();
    } on SocketException {
      response.setResponseType = ResponseStatus.serverError;
    } on TimeoutException {
      response.setResponseType = ResponseStatus.timeout;
    } catch (e) {
      print(e);
    }
  }

  Future<BlogSparkResponse> signUp() async {
    String body = jsonEncode(user.map);
    _config.setUrl = "register";
    BlogSparkResponse response = BlogSparkResponse();
    tryExcept(
        response: response,
        function: () async {
          Response request = await http.post(_config.url,
              body: body, headers: _config.headers);
          ResponseStatus responseType =
              BlogSparkResponse.fromInt(request.statusCode);
          response.setResponseType = responseType;
          response.setBody = jsonDecode(request.body);
        });
    return response;
  }

  Future<BlogSparkResponse> signIn() async {
    String body = jsonEncode(user.map);
    _config.setUrl = "login";
    BlogSparkResponse response = BlogSparkResponse();
    try {
      Response request =
          await http.post(_config.url, body: body, headers: _config.headers);
      ResponseStatus responseType =
          BlogSparkResponse.fromInt(request.statusCode);
      response.setResponseType = responseType;
      response.setBody = jsonDecode(request.body);
    } on SocketException {
      response.setResponseType = ResponseStatus.serverError;
    } on TimeoutException {
      response.setResponseType = ResponseStatus.timeout;
    } catch (e) {
      print(e);
    }
    return response;
  }

  Future<BlogSparkResponse> updateUser() async {
    String token = UserSharedPreferences.getToken() ?? "";
    Map<String, dynamic> data = user.updateMap();
    String body = jsonEncode(data);
    _config.setUrl = "${user.id}/update";
    _config.setToken = token;
    BlogSparkResponse response = BlogSparkResponse();
    try {
      Response request =
          await http.put(_config.url, body: body, headers: _config.headers);
      ResponseStatus responseType =
          BlogSparkResponse.fromInt(request.statusCode);
      response.setResponseType = responseType;
      response.setBody = jsonDecode(request.body);
    } on SocketException {
      response.setResponseType = ResponseStatus.serverError;
    } on TimeoutException {
      response.setResponseType = ResponseStatus.timeout;
    } catch (e) {
      print(e);
    }
    return response;
  }

  Future<BlogSparkResponse> cloudinaryUpload(String image) async {
    String fileName = "${user.firstname}_${user.lastname}";
    BlogSparkVariables variables = BlogSparkVariables();
    BlogSparkResponse response = BlogSparkResponse();
    try {
      CloudinaryResponse request =
          await variables.cloudinary.uploadResource(CloudinaryUploadResource(
        filePath: image,
        fileName: fileName,
        resourceType: CloudinaryResourceType.image,
        uploadPreset: variables.uploadPreset,
        folder: variables.uploadFolder,
      ));
      ResponseStatus responseType =
          BlogSparkResponse.fromInt(request.statusCode!);
      response.setResponseType = responseType;
      response.setBody = {"image": request.url};
    } on SocketException {
      response.setResponseType = ResponseStatus.serverError;
    } on TimeoutException {
      response.setResponseType = ResponseStatus.timeout;
    } catch (e) {
      print("cloudinary error - $e");
    }
    return response;
  }
}
