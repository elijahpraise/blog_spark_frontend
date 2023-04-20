import 'dart:async';
import 'dart:convert';

import 'package:blog_spark/backend_services/blog_spark_response.dart';
import 'package:blog_spark/backend_services/config.dart';
import 'package:blog_spark/models/comment.dart';
import 'package:blog_spark/models/post.dart';

class PostServices {
  const PostServices({required this.post, this.comment, required this.token});
  final Post post;
  final String token;
  final Comment? comment;

  static const String _postPath = "post/";
  static BlogSparkConfig _config = BlogSparkConfig();

  Future<BlogSparkResponse> createPost() async {
    String body = jsonEncode(post.map);
    _config.setUrl = "$_postPath/create";
    BlogSparkResponse response = BlogSparkResponse();
    await _config.makeRequest(
        response: response,
        requestMethod: RequestMethod.post,
        body: body,
        token: token);
    return response;
  }

  Future<BlogSparkResponse> getPosts() async {
    _config.setUrl = "$_postPath";
    BlogSparkResponse response = BlogSparkResponse();
    await _config.makeRequest(
        response: response, requestMethod: RequestMethod.get);
    return response;
  }

  Future<BlogSparkResponse> postDetail() async {
    _config.setUrl = "$_postPath/${post.id}";
    BlogSparkResponse response = BlogSparkResponse();
    await _config.makeRequest(
        response: response, requestMethod: RequestMethod.get);
    return response;
  }

  Future<BlogSparkResponse> deletePost() async {
    _config.setToken = token;
    _config.setUrl = "$_postPath/${post.id}/delete";
    BlogSparkResponse response = BlogSparkResponse();
    await _config.makeRequest(
        response: response, requestMethod: RequestMethod.delete, token: token);
    return response;
  }

  Future<BlogSparkResponse> updatePost() async {
    _config.setUrl = "$_postPath/${post.id}/update";
    String body = jsonEncode(post.updateMap());
    BlogSparkResponse response = BlogSparkResponse();
    await _config.makeRequest(
        response: response,
        requestMethod: RequestMethod.put,
        token: token,
        body: body);
    return response;
  }

  Future<BlogSparkResponse> createComment() async {
    _config.setUrl = "$_postPath/${post.id}/comment";
    String body = jsonEncode(comment!.map);
    BlogSparkResponse response = BlogSparkResponse();
    await _config.makeRequest(
        response: response,
        requestMethod: RequestMethod.post,
        token: token,
        body: body);
    return response;
  }

  Future<BlogSparkResponse> getComments() async {
    _config.setUrl = "$_postPath/${post.id}/comments";
    BlogSparkResponse response = BlogSparkResponse();
    await _config.makeRequest(
        response: response, requestMethod: RequestMethod.get, token: token);
    return response;
  }

  Future<BlogSparkResponse> deleteComment() async {
    _config.setUrl = "$_postPath/${comment!.id}/delete";
    BlogSparkResponse response = BlogSparkResponse();
    await _config.makeRequest(
        response: response, requestMethod: RequestMethod.delete, token: token);
    return response;
  }

  Future<BlogSparkResponse> likePost() async {
    _config.setUrl = "$_postPath/${post.id}/like";
    BlogSparkResponse response = BlogSparkResponse();
    await _config.makeRequest(
        response: response, requestMethod: RequestMethod.put, token: token);
    return response;
  }

  Future<BlogSparkResponse> unlikePost() async {
    _config.setUrl = "$_postPath/${post.id}/unlike";
    BlogSparkResponse response = BlogSparkResponse();
    await _config.makeRequest(
        response: response, requestMethod: RequestMethod.put, token: token);
    return response;
  }
}
