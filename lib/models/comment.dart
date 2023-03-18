import 'package:blog_spark/models/user.dart';

class Comment {
  const Comment({
    this.id,
    required this.author,
    required this.content,
    required this.post,
    this.authorDetails,
    this.dateCreated,
    this.lastUpdated,
  });
  final String author;
  final String? id;
  final User? authorDetails;
  final String content;
  final String post;
  final DateTime? dateCreated;
  final DateTime? lastUpdated;

  factory Comment.fromMap(Map<String, dynamic> map) {
    String author = map["author"];
    User? authorDetails = map["author_details"];
    String content = map["content"];
    String post = map["post"];
    String id = map["id"];
    DateTime? dateCreated = DateTime.parse(map["date_created"]);
    DateTime? lastUpdated = DateTime.parse(map["last_updated"]);
    return Comment(
      id: id,
      author: author,
      content: content,
      post: post,
      authorDetails: authorDetails,
      dateCreated: dateCreated,
      lastUpdated: lastUpdated,
    );
  }

  Map<String, dynamic> get map =>
      {"author": author, "content": content, "post": post};

  @override
  String toString() {
    map["id"] = id;
    return map.toString();
  }
}
