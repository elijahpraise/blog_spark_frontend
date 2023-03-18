import 'package:blog_spark/utils/blog_spark_images/image_names.dart';

class BlogSparkConstants {
  static List<Map<String, dynamic>> slides = [
    {"text": 'Welcome to Blog Spark', "image": BlogSparkImages.slide1},
    {"text": 'Find your inspiration', "image": BlogSparkImages.slide2},
    {
      "text": 'Create and share your own content',
      "image": BlogSparkImages.slide3
    }
  ];

  static List<String> genders = ["Male", "Female"];

  static String initialCountryCode = "NG";
}
