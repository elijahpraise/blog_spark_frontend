enum ResponseStatus {
  http200,
  http201,
  http400,
  http401,
  http404,
  http500,
  serverError,
  timeout,
}

class BlogSparkResponse {
  ResponseStatus _responseStatus = ResponseStatus.http200;
  String _body = "";

  ResponseStatus get responseType => _responseStatus;
  String get body => _body;

  set setResponseStatus(ResponseStatus value) => _responseStatus = value;
  set setBody(String value) => _body = value;

  static ResponseStatus fromInt(int value) {
    ResponseStatus result = ResponseStatus.http500;
    if (value == 200) {
      result = ResponseStatus.http200;
    } else if (value == 201) {
      result = ResponseStatus.http201;
    } else if (value == 201) {
      result = ResponseStatus.http201;
    } else if (value == 400) {
      result = ResponseStatus.http400;
    } else if (value == 401) {
      result = ResponseStatus.http401;
    } else if (value == 404) {
      result = ResponseStatus.http404;
    } else if (value == 500) {
      result = ResponseStatus.http500;
    }
    return result;
  }
}
