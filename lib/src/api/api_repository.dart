import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:logger/logger.dart';

import '../../global_locator.dart';
import '../utils/lang/type_safety.dart';
import 'endpoint.dart';

enum Protocol { http, https }

abstract class APIRepository {
  Future<Map<String, dynamic>> request({required Endpoint endpoint});
}

class DefaultAPIRepository implements APIRepository {
  final _logger = global<Logger>();

  @override
  Future<Map<String, dynamic>> request({required Endpoint endpoint}) async {
    _logger.d('Request endpoint: ${endpoint.body}');
    Uri url;
    try {
      url = Uri.https(
        //String.fromEnvironment('apiUrl'),
        'api.thecatapi.com',
        endpoint.path,
        endpoint.queryParameters,
      );
      // if (String.fromEnvironment('protocol') == Protocol.https.name) {

      // } else {
      //   url = Uri.http(
      //     //String.fromEnvironment('apiUrl'),
      //     'api.thecatapi.com',
      //     endpoint.path,
      //     endpoint.queryParameters,
      //   );
      // }
    } catch (e) {
      _logger.e('APIRepository - Error parse uri$e ');
      Exception('Error parse uri $e');
      return {};
    }

    var headers = {
      HttpHeaders.acceptHeader: '*/*',
      HttpHeaders.contentTypeHeader: 'application/json',
      'x-api-key': 'bda53789-d59e-46cd-9bc4-2936630fde39'
    };
    headers.addAll(endpoint.headers);
    try {
      final result = await requestDistributor(endpoint, url, headers);
      return _handleResponse(result);
    } catch (e) {
      return _handlerError(e);
    }
  }

  Future<Response> requestDistributor(
    Endpoint endpoint,
    Uri url,
    Map<String, String> headers,
  ) async {
    switch (endpoint.method) {
      case Method.get:
        return _get(url, headers);
    }
  }

  Future<Response> _get(Uri url, Map<String, String> headers) {
    _logger.d('get() with url ($url) - headers ($headers)');
    return http.get(url, headers: headers);
  }

  Map<String, dynamic> _handleResponse(Response response) {
    _logger.d('Response - statusCode: ${response.statusCode}');
    final decodedBody = json.decode(response.body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      Map<String, dynamic>? map = cast<Map<String, dynamic>>(decodedBody);
      if (map != null) {
        map.addAll({'statusCode': response.statusCode});
        _logger.d('Response - body map: $map');
        return map;
      }
    }
    _logger.d('Response error ${response.body}');
    var map = cast<Map<String, dynamic>>(decodedBody);
    if (map != null) {
      map.addAll({'statusCode': response.statusCode});
      _logger.d('Response - body map: $map');
      return map;
    }
    if (map == null) {
      return {
        'data': decodedBody,
        'statusCode': response.statusCode,
      };
    }
    return {'statusCode': response.statusCode};
  }

  Map<String, dynamic> _handlerError(Object e) {
    _logger.e('APIRepository - Error post $e ');
    return {
      'status': false,
      'message': 'Error post $e',
      'statusCode': '500',
    };
  }
}
