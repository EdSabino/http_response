import 'package:expected_response/src/server_response.dart';

/// Is the default exception for an unknown status code
class UnrecognizedHttpResponse implements Exception {
  UnrecognizedHttpResponse(this.response);

  final ServerResponse response;
}