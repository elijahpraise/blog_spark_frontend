import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'package:blog_spark/backend_services/blog_spark_response.dart';

enum RequestMethod { post, get, delete, put, patch }

class BlogSparkConfig {
  String _baseUrl = "http://127.0.0.1:8000/";

  String _url = "";

  Map<String, String> _headers = {
    "Content-Type": "application/json",
  };

  Uri get url => Uri.parse(_url);
  Map<String, String> get headers => _headers;

  set setUrl(String encodedPath) => _url = "$_baseUrl$encodedPath";

  set setToken(String value) => _headers["Authorization"] = "Token $value";

  tryExcept(
      {required BlogSparkResponse response,
      required Function() function}) async {
    try {
      await function();
    } on SocketException {
      response.setResponseStatus = ResponseStatus.serverError;
    } on TimeoutException {
      response.setResponseStatus = ResponseStatus.timeout;
    } catch (e) {
      print("error  ....................$e");
    }
  }

  makeRequest(
      {required BlogSparkResponse response,
      String body = "",
      String token = "",
      required RequestMethod requestMethod}) async {
    token.isEmpty ? null : setToken = token;
    await tryExcept(
      response: response,
      function: () async {
        Response? request;
        switch (requestMethod) {
          case RequestMethod.post:
            request = await http.post(url, body: body, headers: headers);
            break;
          case RequestMethod.get:
            request = await http.get(url, headers: headers);
            break;
          case RequestMethod.delete:
            request = await http.delete(url, headers: headers);
            break;
          case RequestMethod.put:
            // TODO: Handle this case.
            break;
          case RequestMethod.patch:
            // TODO: Handle this case.
            break;
        }
        ResponseStatus responseStatus =
            BlogSparkResponse.fromInt(request!.statusCode);
        response.setResponseStatus = responseStatus;
        response.setBody = request.body;
      },
    );
  }
}
