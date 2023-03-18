enum ResponseType {
  http200,
  http201,
  http400,
  http401,
  http404,
  http500,
  serverError,
  timeOut,
}

class BlogSparkResponse {
  ResponseType _responseType = ResponseType.http200;
  Map<String, dynamic> _body = {};

  ResponseType get responseType => _responseType;
  Map<String, dynamic> get body => _body;

  set setResponseType(ResponseType value) => _responseType = value;
  set setBody(Map<String, dynamic> value) => _body = value;

  static ResponseType fromInt(int value) {
    ResponseType result = ResponseType.http200;
    if (value == 200) {
    } else if (value == 201) {
      result = ResponseType.http201;
    } else if (value == 201) {
      result = ResponseType.http201;
    } else if (value == 400) {
      result = ResponseType.http400;
    } else if (value == 401) {
      result = ResponseType.http401;
    } else if (value == 404) {
      result = ResponseType.http404;
    } else if (value == 500) {
      result = ResponseType.http500;
    }
    // else if (value == 201) {
    //   result = ResponseType.http201;
    // } else if (value == 201) {
    //   result = ResponseType.http201;
    // }
    return result;
  }
}
