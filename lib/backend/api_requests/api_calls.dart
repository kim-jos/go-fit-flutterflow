import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start  Steppay Group Code

class SteppayGroup {
  static String baseUrl = 'https://api.steppay.kr/api/v1';
  static Map<String, String> headers = {
    'Secret-Token':
        'aa9940916492075b347401318e68c3437bda8dfa5259fa5914631205ccd3e868',
    'accept': '*/*',
    'content-type': 'application/json',
  };
  static CreatePaymentCall createPaymentCall = CreatePaymentCall();
  static CreateUserCall createUserCall = CreateUserCall();
}

class CreatePaymentCall {
  Future<ApiCallResponse> call() {
    final body = '''
{
  "items": [
    {
      "currency": "KRW",
      "minimumQuantity": 1,
      "productCode": "product_WCEal5aUX",
      "priceCode": "price_jrfXTBJ2e"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Payment',
      apiUrl: '${SteppayGroup.baseUrl}/orders',
      callType: ApiCallType.POST,
      headers: {
        ...SteppayGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CreateUserCall {
  Future<ApiCallResponse> call({
    String? displayName = '',
    String? email = '',
  }) {
    final body = '''
{
  "name": "${displayName}",
  "email": "${email}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create User',
      apiUrl: '${SteppayGroup.baseUrl}/customers',
      callType: ApiCallType.POST,
      headers: {
        ...SteppayGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End  Steppay Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
