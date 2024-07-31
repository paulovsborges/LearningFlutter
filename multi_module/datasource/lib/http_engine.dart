import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpEngine {
  static const String baseUrl = 'rickandmortyapi.com';

  Future<JsonData> test({
    required String endpoint,
    Map<String, dynamic> queryParameters = const {},
  }) async {
    return makeRequest(
      endpoint: endpoint,
      queryParameters: queryParameters,
    );
  }

  Future<T> makeRequest<T>({
    required String endpoint,
    Map<String, dynamic> queryParameters = const {},
  }) async {
    final url = Uri.https(
      baseUrl,
      endpoint,
      queryParameters,
    );

    final response = await http.get(url);

    debugPrint('response code ${response.statusCode}');

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final info = json['info'] as Map<String, dynamic>;

      debugPrint('$json');
      return JsonData(results: '${info['count']}') as T;
    }

    if (response.statusCode >= 400) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      throw BusinessError(message: json['error']);
    }

    if (response.statusCode == 401) {
      throw UnauthorizedError();
    }

    if (response.statusCode >= 500) {
      throw ServerError();
    }

    throw Exception();
  }
}

class JsonData<T> {
  JsonData({this.results});

  final T? results;
}

abstract class MyException implements Exception {}

final class BusinessError implements MyException {
  BusinessError({required this.message});

  final String message;
}

final class UnauthorizedError implements MyException {}

final class ServerError implements MyException {}
