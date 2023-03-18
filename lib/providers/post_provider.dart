import 'package:blog_spark/models/post.dart';
import 'package:blog_spark/models/user.dart';
import 'package:flutter/material.dart';

class PostProvider extends ChangeNotifier {
  String _title = "";
  String _content = "";
  String _image = "";
  String _author = "";
  String _category = "";
  User? _authorDetails;
  int _likes = 0;
  Post? _post;

  String get title => _title;
  String get content => _content;
  String get image => _image;
  String get author => _author;
  String get category => _category;
  int get likes => _likes;
  User? get authorDetails => _authorDetails;
  Post? get post => _post;

  set setTitle(String value) {
    _title = value;
    notifyListeners();
  }

  set setContent(String value) {
    _content = value;
    notifyListeners();
  }

  set setImage(String value) {
    _image = value;
    notifyListeners();
  }

  set setAuthor(String value) {
    _author = value;
    notifyListeners();
  }

  set setCategory(String value) {
    _category = value;
    notifyListeners();
  }

  set setAuthorDetails(Map<String, dynamic> value) {
    _authorDetails = User.fromMap(value);
    notifyListeners();
  }

  set setPost(Map<String, dynamic> value) {
    _post = Post.fromMap(value);
    notifyListeners();
  }

  int Function() get like => () {
        _likes += 1;
        notifyListeners();
        return _likes;
      };
  int Function() get unlike => () {
        _likes -= 1;
        notifyListeners();
        return _likes;
      };
}
