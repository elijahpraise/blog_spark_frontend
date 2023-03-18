class BlogSparkConfig {
  String _baseUrl = "http://127.0.0.1:8000/";

  String _url = "";

  Map<String, String> _headers = {
    "Content-Type": "application/json",
  };

  Uri get url => Uri.parse(_url);
  Map<String, String> get headers => _headers;

  set setUrl(String encodedPath) => _url = "$_baseUrl/$encodedPath";

  set setToken(String value) => _headers["Authorization"] = "Token $value";
}
