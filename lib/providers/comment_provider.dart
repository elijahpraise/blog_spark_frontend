import 'package:blog_spark/models/comment.dart';
import 'package:flutter/material.dart';

class CommentProvider extends ChangeNotifier {
  String _author = "";
  String _content = "";
  String _post = "";
  Comment? _comment;

  String get author => _author;
  String get content => _content;
  String get post => _post;
  Comment? get comment => _comment;

  set setAuthor(String value) {
    _author = value;
    notifyListeners();
  }

  set setContent(String value) {
    _content = value;
    notifyListeners();
  }

  set setPost(String value) {
    _post = value;
    notifyListeners();
  }

  set setComment(Map<String, dynamic> value) {
    _comment = Comment.fromMap(value);
    notifyListeners();
  }
}
