// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mocked.dart';

// **************************************************************************
// ExpectResponseGenerator
// **************************************************************************

void _buildResponse(Mocked me, bool params) async {
  try {
    final ServerResponse response = await me.requestFunction(params);
    switch (response.statusCode) {
      case 200:
        me.successResponse(response, params);
        break;
      case 401:
        me.response401(response, params);
        break;
      case 403:
        me.response403(response, params);
        break;
      case 500:
        me.response500(response, params);
        break;
      default:
        me.defaultResponse(response, params);
        break;
    }
  } catch (e) {
    me.defaultError(e);
  }
  return null;
}
