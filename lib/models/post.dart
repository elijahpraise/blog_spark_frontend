import 'package:blog_spark/models/user.dart';

class Post {
  const Post({
    this.id,
    this.image,
    this.authorDetails,
    required this.likes,
    required this.title,
    required this.content,
    required this.author,
    required this.category,
  });
  final int likes;
  final String? id;
  final String title;
  final String content;
  final String? image;
  final String author;
  final String category;
  final User? authorDetails;

  factory Post.fromMap(Map<String, dynamic> map) {
    int likes = map["likes"];
    String title = map["title"];
    String content = map["content"];
    String id = map["id"];
    String? image = map["image"];
    User? authorDetails = User.fromMap(map["author_details"]);
    String author = map["author"];
    String category = map["category"];
    return Post(
        id: id,
        likes: likes,
        title: title,
        content: content,
        author: author,
        category: category,
        authorDetails: authorDetails,
        image: image);
  }

  Map<String, dynamic> get map => {
        "title": title,
        "content": content,
        "image": image,
        "author": author,
        "category": category
      };

  @override
  String toString() {
    map["id"] = id;
    return map.toString();
  }
}
