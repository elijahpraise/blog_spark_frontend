import 'package:blog_spark/models/user.dart';

class Post {
  const Post({
    this.id,
    this.image,
    this.authorDetails,
    this.likes = 0,
    this.title,
    this.content,
    this.author,
    this.category,
    this.dateCreated,
    this.lastUpdated,
    this.readingTime,
  });
  final int likes;
  final String? id;
  final String? title;
  final String? content;
  final String? image;
  final String? author;
  final String? category;
  final User? authorDetails;
  final DateTime? dateCreated;
  final DateTime? lastUpdated;
  final Duration? readingTime;

  static int calculateReadingTime(String text) {
    final int wordsPerMinute =
        200; // Average adult reading speed in words per minute
    final int wordCount = text.trim().split(' ').length;
    final int readingTime = (wordCount / wordsPerMinute).ceil();
    print("reading time - $readingTime");
    return readingTime;
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    int likes = map["likes"];
    String title = map["title"];
    String content = map["content"];
    String id = map["id"];
    String? image = map["image"];
    User? authorDetails = User.fromMap(map["author_details"]);
    String author = map["author"];
    String category = map["category"];
    DateTime? dateCreated = DateTime.parse(map["date_created"]);
    DateTime? lastUpdated = DateTime.parse(map["last_updated"]);
    Duration? readingTime = Duration(minutes: calculateReadingTime(content));
    return Post(
        id: id,
        likes: likes,
        title: title,
        content: content,
        author: author,
        category: category,
        authorDetails: authorDetails,
        dateCreated: dateCreated,
        lastUpdated: lastUpdated,
        readingTime: readingTime,
        image: image);
  }

  Map<String, dynamic> get map => {
        "title": title,
        "content": content,
        "image": image,
        "author": author,
        "category": category
      };

  Map<String, dynamic> Function() get updateMap => () {
        Map<String, dynamic> data = map;
        data.forEach((key, value) {
          if (map[key] == null) {
            data.remove(key);
          }
        });
        return data;
      };

  @override
  String toString() {
    map["id"] = id;
    return map.toString();
  }
}
