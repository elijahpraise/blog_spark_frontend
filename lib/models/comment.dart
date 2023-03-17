import 'package:blog_spark/models/user.dart';

class Comment {
  const Comment(
      {required this.author,
      required this.content,
      required this.post,
      this.authorDetails,
      this.id});
  final String author;
  final String? id;
  final User? authorDetails;
  final String content;
  final String post;

  factory Comment.fromMap(Map<String, dynamic> map) {
    String author = map["author"];
    User? authorDetails = map["author_details"];
    String content = map["content"];
    String post = map["post"];
    String id = map["id"];
    return Comment(
        author: author,
        content: content,
        post: post,
        authorDetails: authorDetails,
        id: id);
  }

  Map<String, dynamic> get map =>
      {"author": author, "content": content, "post": post};

  @override
  String toString() {
    map["id"] = id;
    return map.toString();
  }
}
