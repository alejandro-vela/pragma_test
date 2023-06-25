enum Method { get }

abstract class Endpoint {
  String get path;

  Method get method;

  Map<String, dynamic> body = {};

  Map<String, dynamic> queryParameters = {};

  Map<String, String> headers = {};

  Endpoint();
}
