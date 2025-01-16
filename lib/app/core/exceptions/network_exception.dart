class NetworkException implements Exception {
  final int statusCode;
  late final String message;

  NetworkException({
    required this.statusCode,
  }) {
    switch (statusCode) {
      case 400:
        message =
            "Bad Request: The request could not be understood by the server.";
        break;
      case 401:
        message = "Unauthorized: Access is denied due to invalid credentials.";
        break;
      case 403:
        message =
            "Forbidden: You do not have permission to access this resource.";
        break;
      case 404:
        message = "Not Found: The requested resource could not be found.";
        break;
      case 500:
        message =
            "Internal Server Error: The server encountered an unexpected condition.";
        break;
      case 502:
        message =
            "Bad Gateway: The server received an invalid response from the upstream server.";
        break;
      case 503:
        message =
            "Service Unavailable: The server is currently unable to handle the request.";
        break;
      case 504:
        message =
            "Gateway Timeout: The server did not receive a timely response from the upstream server.";
        break;
      default:
        message = "An unexpected error occurred. Please try again later.";
        break;
    }
  }

  @override
  String toString() => message;
}
