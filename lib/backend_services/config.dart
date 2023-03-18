class BlogSparkConfig {
  String _baseUrl = "";

  String _url = "";

  Map<String, String> _headers = {
    "Content-Type": "application/json",
  };

  Uri get url => Uri.parse(_url);
  Map<String, String> get headers => _headers;

  set setUrl(String encodedPath) => _url = "$_baseUrl/$encodedPath";

  set setToken(String value) => _headers["Authorization"] = "Token $value";
}
