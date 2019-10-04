/// Contains the @Response annotation
/// 
/// This define the behaviour for each response code in the return of an http request
class Response {
  const Response([this.code]);

  /// The return code from an http response
  final int code;
}