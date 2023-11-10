import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Blog Group Code

class BlogGroup {
  static String baseUrl = 'https://consultadetodos.com/wp-json/wp/v2';
  static Map<String, String> headers = {};
  static GetArtigosDestacadosCall getArtigosDestacadosCall =
      GetArtigosDestacadosCall();
  static GetArtigosCall getArtigosCall = GetArtigosCall();
  static GetArtigoCall getArtigoCall = GetArtigoCall();
}

class GetArtigosDestacadosCall {
  Future<ApiCallResponse> call({
    String? include = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getArtigosDestacados',
      apiUrl: '${BlogGroup.baseUrl}/posts',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        '_embed': true,
        'include': include,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetArtigosCall {
  Future<ApiCallResponse> call({
    String? tags = '24,25,29,33,36,31,27',
    String? search = '',
    String? page = '1',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getArtigos',
      apiUrl: '${BlogGroup.baseUrl}/posts',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        '_embed': true,
        'tags': tags,
        'search': search,
        'per_page': "10",
        'page': page,
        'orderby': "date",
        'order': "desc",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetArtigoCall {
  Future<ApiCallResponse> call({
    String? slug = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getArtigo',
      apiUrl: '${BlogGroup.baseUrl}/posts',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        '_embed': true,
        'slug': slug,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Blog Group Code

/// Start Consulta Group Code

class ConsultaGroup {
  static String baseUrl = 'https://apiauxiliobolsa.com';
  static Map<String, String> headers = {};
  static GetBolsaCall getBolsaCall = GetBolsaCall();
}

class GetBolsaCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? nis = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getBolsa',
      apiUrl: '${ConsultaGroup.baseUrl}/pagamentos/${nis}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Consulta Group Code

class GetIdArtigosDestacadosCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getIdArtigosDestacados',
      apiUrl: 'http://consultabeneficios.com.br/api.php?acao=buscarIds',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

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
