import 'dart:async';

import 'package:expected_response/expected_response.dart';

class MyBase<T> extends HttpBase<T> {

  final StreamController<T> stream = StreamController<T>();

  void defaultError(Exception e) {
    stream.addError(e);
  }

  void defaultResponse(ServerResponse response, T params) {
    throw Exception();
  }

  void response401(ServerResponse response, T params) {

  }
  void response403(ServerResponse response, T params) {

  }
  void response500(ServerResponse response, T params) {

  }
}