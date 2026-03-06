import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SimulatePaymentCall {
  static Future<ApiCallResponse> call({
    String? userid = '',
    String? orderDate = '01/01/2024',
    double? totalAmount = 0,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'SimulatePayment',
      apiUrl: 'https://jsonplaceholder.typicode.com/posts',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CheckProfanityGeminiCall {
  static Future<ApiCallResponse> call({
    String? messageInput = '',
  }) async {
    final ffApiRequestBody = '''
{
  "contents": [
    {
      "role": "user",
      "parts": [
        {
          "text": "Le message suivant est-il injurieux, raciste, haineux ou inapproprié pour un chat public ? Répondez UNIQUEMENT par le mot 'true' si oui, et UNIQUEMENT par le mot 'false' si non. Message : {{message_input}}"
        }
      ]
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CheckProfanityGemini',
      apiUrl:
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent',
      callType: ApiCallType.POST,
      headers: {
        'x-goog-api-key': 'AIzaSyAUowoctJpLo54rlV6LdslVZ0Enr21xRzE',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? moderationresult(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.candidates[0].content.parts[0].text''',
      ));
}

class ImageCall {
  static Future<ApiCallResponse> call({
    FFUploadedFile? image,
    String? key = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'image',
      apiUrl: 'https://api.imgbb.com/1/upload',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'image': image,
        'key': key,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic imageurl(dynamic response) => getJsonField(
        response,
        r'''$.data.url''',
      );
}

class PlayersSearchApiCall {
  static Future<ApiCallResponse> call({
    String? search = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'PlayersSearchApi',
      apiUrl:
          'https://www.wikidata.org/w/api.php?action=wbsearchentities&language=en&format=json&limit=20',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'search': search,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetPlayerDetailsCall {
  static Future<ApiCallResponse> call({
    String? searchText = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getPlayerDetails',
      apiUrl: 'https://www.thesportsdb.com/api/v1/json/123/searchteams.php',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        't': searchText,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class OpenWeatherForecastCall {
  static Future<ApiCallResponse> call({
    String? apikey = 'a623ae0f19eec35d19b3daa222a1cb13',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'OpenWeatherForecast',
      apiUrl: 'https://api.openweathermap.org/data/2.5/forecast',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'lat': 36.8065,
        'lon': 10.1815,
        'units': "metric",
        'appid': apikey,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<int>? forecastDtList(dynamic response) => (getJsonField(
        response,
        r'''$.list[:].dt''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<double>? tempList(dynamic response) => (getJsonField(
        response,
        r'''$.list[:].main.temp''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<String>? descList(dynamic response) => (getJsonField(
        response,
        r'''$.list[:].weather[0].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? iconList(dynamic response) => (getJsonField(
        response,
        r'''$.list[:].weather[0].icon''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class FeedbackSentimentClassificationCall {
  static Future<ApiCallResponse> call({
    String? text = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Feedback Sentiment Classification',
      apiUrl: 'https://api.api-ninjas.com/v1/sentiment?text=I\'m loving it!',
      callType: ApiCallType.GET,
      headers: {
        'X-Api-Key': 'OQgsyIXgBI3UKKNzYRb8hQ==8LmD5rbp5A6Er9OS',
      },
      params: {
        'text': text,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FeedbackResponseGenerationCall {
  static Future<ApiCallResponse> call({
    String? prompt = '',
  }) async {
    final ffApiRequestBody = '''
{
  "model": "llama-3.3-70b-versatile",
  "messages": [
    {
      "role": "system",
      "content": "You are an Admin for the mobile app that's related to football (soccer). Your role is to respond to user feedback tickets. Be polite and concise. **DO NOT EXCEED 3 SENTENCES** Here is the user feedback :"
    },
    {
      "role": "user",
      "content": "${escapeStringForJson(prompt)}"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Feedback Response Generation',
      apiUrl: 'https://api.groq.com/openai/v1/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer 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',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
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

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
