import 'package:expected_response/expected_response.dart';

import 'my_base.dart';

part 'mocked.g.dart';

@ExpectedResponse(allowedCodes: [200, 401, 403, 500])
class Mocked extends MyBase<bool> {

  @EntryFunction()
  bool base(bool base) {
    _buildResponse(this, base);
    return true;
  }

  @Request()
  Future<ServerResponse> requestFunction(bool base) async => await request(this, base);

  @Response(200)
  void successResponse(ServerResponse response, bool base) {

  }

  Future<ServerResponse> request(Mocked me, bool base) async {
    return ServerResponse(200, '');
  }
}