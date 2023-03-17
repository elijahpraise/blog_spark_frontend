class BlogSparkConfig {
  String _baseUrl = "";

  String _urlPath = "";

  set setUrl(String encodedPath) => "$_baseUrl/$encodedPath";

  String get getUrl => _urlPath;
}
