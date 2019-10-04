/// Contains the @ExpectedResponse annotation
/// 
/// This annotations is the entrypoint of everything, identifies the class where the ecossystem will run
class ExpectedResponse {
  const ExpectedResponse({this.allowedCodes});

  /// All codes in that lsit will be treated, having an @Response for them or not, if not, will call response{statusCode}(response, params), used for default bahaviours
  final List<int> allowedCodes;
}