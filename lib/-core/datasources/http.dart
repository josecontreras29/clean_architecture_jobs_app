import 'dart:convert';

import 'package:http/http.dart' as http;

class ClientHttp {
  final client = http.Client();
  static const staticheaders = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Accept': 'application/json',
    'Access-Control-Allow-Credentials': 'true'
  };

  Future<ResponseFromApi> get(
      {required String url,
      Map<String, String> headers = staticheaders}) async {
    try {
      headers.addAll(staticheaders);
      final response = await client.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        return ResponseFromApi(
            json: jsonDecode(response.body), code: response.statusCode);
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to make the request: $error');
    }
  }

  Future<ResponseFromApi> post(
      {required String url,
      Map<String, String> headers = staticheaders,
      dynamic body}) async {
    try {
      headers.addAll(staticheaders);
      final response = await client.post(Uri.parse(url),
          headers: headers, body: jsonEncode(body));
      return ResponseFromApi(
          json: jsonDecode(response.body), code: response.statusCode);
    } catch (error) {
      throw error.toString();
    }
  }
}

class ResponseFromApi {
  Map<String, dynamic> json;
  int code;
  ResponseFromApi({required this.json, required this.code});

  Map<String, dynamic> toJson() {
    return {"json": json, "code": code};
  }
}
