import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:nectar/core/constants/api_constatnts.dart';

class ApiService {
  static Future<http.Response> get(
    String path, {
    Map<String, String>? params,
  }) async {
    try {
      final uri = Uri.https(
        ApiConstants.baseUrl.replaceAll('https://', ''),
        path,
        params,
      );
      final response = await http.get(uri, headers: _headers());
      _handleError(response);
      return response;
    } on SocketException {
      throw 'No Internet connection';
    } catch (e) {
      throw e.toString;
    }
  }

  static Future<http.Response> post(
    String path,
    Map<String, dynamic> body,
  ) async {
    try{
    final uri = Uri.https(
      ApiConstants.baseUrl,
      path,
    );
    final response = await http.post(
      uri,
      headers: _headers(),
      body: jsonEncode(body),
    );
    _handleError(response);
    return response;
  } on SocketException {
      throw 'No Internet connection';
    } catch (e) {
      throw e.toString;
    }
  }

  static Future<http.Response> put(
    String path,
    Map<String, dynamic> body,
  ) async {
    try{
    final uri = Uri.https(
      ApiConstants.baseUrl,
      path,
    );
    final response = await http.put(
      uri,
      headers: _headers(),
      body: jsonEncode(body),
    );
    _handleError(response);
    return response;
  } on SocketException {
      throw 'No Internet connection';
    } catch (e) {
      throw e.toString;
    }
}

  static Map<String, String> _headers() => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  static void _handleError(http.Response response) {
    if (response.statusCode >= 400) {
      throw Exception('HTTP error: ${response.statusCode} → ${response.body}');
    }
  }
}
