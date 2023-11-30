enum RequestMethod { get, post, delete }

extension RequestMethodString on RequestMethod {
  String get string {
    switch (this) {
      case RequestMethod.get:
        return "GET";
      case RequestMethod.post:
        return "POST";
      case RequestMethod.delete:
        return "DELETE";
    }
  }
}

class NetworkRequest {
  final RequestMethod method;
  final String? path;
  final Map<String, dynamic>? queryPara;
  final Map<String, String>? headers;

  NetworkRequest(
    this.method,
    this.path,
    this.queryPara,
    this.headers,
  );
}
