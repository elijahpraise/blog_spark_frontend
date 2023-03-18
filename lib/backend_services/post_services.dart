import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:blog_spark/backend_services/blog_spark_response.dart';
import 'package:blog_spark/backend_services/config.dart';
import 'package:blog_spark/caching/user_shared_preferences.dart';
import 'package:blog_spark/models/comment.dart';
import 'package:blog_spark/models/post.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class PostServices {
  const PostServices({required this.post, this.comment});
  final Post post;
  final Comment? comment;

  static const String _postPath = "post/";
  static String _token = UserSharedPreferences.getToken() ?? "";
  static BlogSparkConfig _config = BlogSparkConfig();

  Future<BlogSparkResponse> createPost() async {
    String body = jsonEncode(post.map);
    _config.setUrl = "$_postPath/create";
    BlogSparkResponse response = BlogSparkResponse();
    try {
      Response request =
          await http.post(_config.url, body: body, headers: _config.headers);
      ResponseType responseType = BlogSparkResponse.fromInt(request.statusCode);
      response.setResponseType = responseType;
      response.setBody = jsonDecode(request.body);
    } on SocketException {
      response.setResponseType = ResponseType.serverError;
    } on TimeoutException {
      response.setResponseType = ResponseType.timeOut;
    } catch (e) {
      print(e);
    }
    return response;
  }

  Future<BlogSparkResponse> getPosts() async {
    _config.setUrl = "$_postPath";
    BlogSparkResponse response = BlogSparkResponse();
    try {
      Response request = await http.get(_config.url, headers: _config.headers);
      ResponseType responseType = BlogSparkResponse.fromInt(request.statusCode);
      response.setResponseType = responseType;
      response.setBody = jsonDecode(request.body);
    } on SocketException {
      response.setResponseType = ResponseType.serverError;
    } on TimeoutException {
      response.setResponseType = ResponseType.timeOut;
    } catch (e) {
      print(e);
    }
    return response;
  }

  Future<BlogSparkResponse> postDetail() async {
    _config.setUrl = "$_postPath/${post.id}";
    BlogSparkResponse response = BlogSparkResponse();
    try {
      Response request = await http.get(_config.url, headers: _config.headers);
      ResponseType responseType = BlogSparkResponse.fromInt(request.statusCode);
      response.setResponseType = responseType;
      response.setBody = jsonDecode(request.body);
    } on SocketException {
      response.setResponseType = ResponseType.serverError;
    } on TimeoutException {
      response.setResponseType = ResponseType.timeOut;
    } catch (e) {
      print(e);
    }
    return response;
  }

  Future<BlogSparkResponse> deletePost() async {
    _config.setToken = _token;
    _config.setUrl = "$_postPath/${post.id}/delete";
    BlogSparkResponse response = BlogSparkResponse();
    try {
      Response request =
          await http.delete(_config.url, headers: _config.headers);
      ResponseType responseType = BlogSparkResponse.fromInt(request.statusCode);
      response.setResponseType = responseType;
      response.setBody = jsonDecode(request.body);
    } on SocketException {
      response.setResponseType = ResponseType.serverError;
    } on TimeoutException {
      response.setResponseType = ResponseType.timeOut;
    } catch (e) {
      print(e);
    }
    return response;
  }

  Future<BlogSparkResponse> updatePost() async {
    _config.setToken = _token;
    _config.setUrl = "$_postPath/${post.id}/update";
    Map<String, dynamic> data = post.updateMap();
    String body = jsonEncode(data);
    BlogSparkResponse response = BlogSparkResponse();
    try {
      Response request =
          await http.put(_config.url, body: body, headers: _config.headers);
      ResponseType responseType = BlogSparkResponse.fromInt(request.statusCode);
      response.setResponseType = responseType;
      response.setBody = jsonDecode(request.body);
    } on SocketException {
      response.setResponseType = ResponseType.serverError;
    } on TimeoutException {
      response.setResponseType = ResponseType.timeOut;
    } catch (e) {
      print(e);
    }
    return response;
  }

  Future<BlogSparkResponse> createComment() async {
    _config.setToken = _token;
    _config.setUrl = "$_postPath/${post.id}/comment";
    String body = jsonEncode(comment!.map);
    BlogSparkResponse response = BlogSparkResponse();
    try {
      Response request =
          await http.post(_config.url, body: body, headers: _config.headers);
      ResponseType responseType = BlogSparkResponse.fromInt(request.statusCode);
      response.setResponseType = responseType;
      response.setBody = jsonDecode(request.body);
    } on SocketException {
      response.setResponseType = ResponseType.serverError;
    } on TimeoutException {
      response.setResponseType = ResponseType.timeOut;
    } catch (e) {
      print(e);
    }
    return response;
  }

  Future<BlogSparkResponse> getComments() async {
    _config.setUrl = "$_postPath/${post.id}/comments";
    BlogSparkResponse response = BlogSparkResponse();
    try {
      Response request = await http.get(_config.url, headers: _config.headers);
      ResponseType responseType = BlogSparkResponse.fromInt(request.statusCode);
      response.setResponseType = responseType;
      response.setBody = jsonDecode(request.body);
    } on SocketException {
      response.setResponseType = ResponseType.serverError;
    } on TimeoutException {
      response.setResponseType = ResponseType.timeOut;
    } catch (e) {
      print(e);
    }
    return response;
  }

  Future<BlogSparkResponse> deleteComment() async {
    _config.setToken = _token;
    _config.setUrl = "$_postPath/${comment!.id}/delete";
    BlogSparkResponse response = BlogSparkResponse();
    try {
      Response request =
          await http.delete(_config.url, headers: _config.headers);
      ResponseType responseType = BlogSparkResponse.fromInt(request.statusCode);
      response.setResponseType = responseType;
      response.setBody = jsonDecode(request.body);
    } on SocketException {
      response.setResponseType = ResponseType.serverError;
    } on TimeoutException {
      response.setResponseType = ResponseType.timeOut;
    } catch (e) {
      print(e);
    }
    return response;
  }

  Future<BlogSparkResponse> likePost() async {
    _config.setToken = _token;
    _config.setUrl = "$_postPath/${post.id}/like";
    BlogSparkResponse response = BlogSparkResponse();
    try {
      Response request = await http.put(_config.url, headers: _config.headers);
      ResponseType responseType = BlogSparkResponse.fromInt(request.statusCode);
      response.setResponseType = responseType;
      response.setBody = jsonDecode(request.body);
    } on SocketException {
      response.setResponseType = ResponseType.serverError;
    } on TimeoutException {
      response.setResponseType = ResponseType.timeOut;
    } catch (e) {
      print(e);
    }
    return response;
  }

  Future<BlogSparkResponse> unlikePost() async {
    _config.setToken = _token;
    _config.setUrl = "$_postPath/${post.id}/unlike";
    BlogSparkResponse response = BlogSparkResponse();
    try {
      Response request = await http.put(_config.url, headers: _config.headers);
      ResponseType responseType = BlogSparkResponse.fromInt(request.statusCode);
      response.setResponseType = responseType;
      response.setBody = jsonDecode(request.body);
    } on SocketException {
      response.setResponseType = ResponseType.serverError;
    } on TimeoutException {
      response.setResponseType = ResponseType.timeOut;
    } catch (e) {
      print(e);
    }
    return response;
  }
}
