# Expected Response Generator
Create classes and generate code to make it easier to deal with http responses, make the behaviour of the response more verbose, generic, and dry.

## Getting Started

### Installing

Add the following to your pubspec
```
dependencies:
    expected_response: ^1.0.0

dev_dependencies:
    build_runner: ^1.0.0
    expected_response_generator: ^1.0.0
```

run ```pub get```

### Using
See our example to see more.

```
@ExpectedResponse(allowedCodes: [200, 401, 403, 500])
class Mocked extends HttpBase<bool> {

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
```

When the function _buildResponse, the function that was generated, be evoke, it will request the server through the requestFunction, and behave for each response code allowed, and if is 200, will use the successResponse;