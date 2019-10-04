/// This class is responsible to handle the responses, the return of a request must be a server response, or a class that extend server response. Its necessary be cause a need statusCode to make all by mamboJambo
class ServerResponse {
  ServerResponse(this.statusCode, this.data);

  /// The status code of the response
  int statusCode;

  /// The raw body of the response
  String data;
}