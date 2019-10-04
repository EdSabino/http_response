import 'package:expected_response/src/exceptions/unrecognized_http_exception.dart';
import 'package:expected_response/src/server_response.dart';

/// This class was made to deal with all the default behaviour, every class annotated with ExpectedResponse must extend HttpBase, or a class that extends HttpBase
abstract class HttpBase<T> {

  /// Is evoked when some exception throwed
  void defaultError(Exception e);

  /// Is evoked when the status code received is not listed as valid
  void defaultResponse(ServerResponse response, T params) {
    throw UnrecognizedHttpResponse(response);
  }
}