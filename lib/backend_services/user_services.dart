import 'dart:async';
import 'dart:convert';

import 'package:blog_spark/backend_services/blog_spark_response.dart';
import 'package:blog_spark/backend_services/cloudinary_services.dart';
import 'package:blog_spark/backend_services/config.dart';
import 'package:blog_spark/models/user.dart';
import 'package:cloudinary_sdk/cloudinary_sdk.dart';

class UserServices {
  const UserServices({required this.user});
  final User user;

  static BlogSparkConfig _config = BlogSparkConfig();

  Future<BlogSparkResponse> signUp() async {
    String body = jsonEncode(user.map);
    _config.setUrl = "register";
    BlogSparkResponse response = BlogSparkResponse();
    await _config.makeRequest(
        response: response, requestMethod: RequestMethod.post, body: body);
    return response;
  }

  Future<BlogSparkResponse> signIn() async {
    String body = jsonEncode(user.map);
    _config.setUrl = "login";
    BlogSparkResponse response = BlogSparkResponse();
    await _config.makeRequest(
        response: response, requestMethod: RequestMethod.post, body: body);
    return response;
  }

  Future<BlogSparkResponse> updateUser({required String token}) async {
    Map<String, dynamic> data = user.updateMap();
    String body = jsonEncode(data);
    _config.setUrl = "${user.id}/update";
    BlogSparkResponse response = BlogSparkResponse();
    await _config.makeRequest(
        response: response,
        requestMethod: RequestMethod.post,
        body: body,
        token: token);
    return response;
  }

  Future<BlogSparkResponse> cloudinaryUpload(String image) async {
    String fileName = "${user.firstname}_${user.lastname}";
    BlogSparkResponse response = BlogSparkResponse();
    await _config.tryExcept(
      response: response,
      function: () async {
        CloudinaryServices services = CloudinaryServices();
        CloudinaryResponse request =
            await services.uploadResource(imagePath: image, fileName: fileName);
        ResponseStatus responseStatus =
            BlogSparkResponse.fromInt(request.statusCode!);
        response.setResponseStatus = responseStatus;
        response.setBody =
            jsonEncode({"public_id": request.publicId, "image": request.url});
      },
    );
    return response;
  }
}
