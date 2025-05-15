enum ApiErrorType {
  /// It occurs when url is opened timeout.
  connectionTimeout,

  /// It occurs when url is sent timeout.
  sendTimeout,

  ///It occurs when receiving timeout.
  receiveTimeout,

  /// When the server response, but with a incorrect status, such as 404, 503...
  badResponse,

  /// When the request is cancelled, dio will throw a error with this type.
  cancel,

  /// Default error type, Some other Error.
  unknown,

  // When received bad certificate
  badCertificate,

  // When there's an error with the connection between client and API server
  connectionError,
}

const Duration nonCriticalEndpointTimeout = Duration(seconds: 3); // 3 seconds
