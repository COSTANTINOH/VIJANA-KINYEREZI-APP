import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'index.dart';

Future decodingResponse({required String body}) async {
  // Parses the string and returns a respective JSON object
  return await json.decode(body);
}

String encodedRequest({required Map<String, dynamic> req}) {
  // Converts [object] to a JSON string
  return jsonEncode(req);
}

Future<Map<String, dynamic>> transmission({
  String url = appUrl,
  dynamic encodedReq,
  String? api,
}) async {
  return http.post(Uri.parse(url + api!), body: encodedReq).then((response) {
    log("data ${response.body}");

    return {
      'code': response.statusCode,
      'content': response.body,
    };
  });
}

Future<Map<String, dynamic>> postWithHeadertransmission({
  String url = appUrl,
  dynamic encodedReq,
  dynamic header,
  String? api,
}) async {
  return http.post(Uri.parse(url + api!), body: encodedReq, headers: {
    HttpHeaders.authorizationHeader: header,
  }).then((response) {
    return {
      'code': response.statusCode,
      'content': response.body,
    };
  });
}

Future<Map<String, dynamic>> gettransimission({
  String url = appUrl,
  dynamic header,
  String? api,
}) async {
  return http.get(Uri.parse(url + api!), headers: {
    HttpHeaders.authorizationHeader: header,
  }).then((response) {
    // log("data ${response.body}");
    return {
      'code': response.statusCode,
      'content': response.body,
    };
  });
}

Future<Map<String, dynamic>> deletetransimission({
  String url = appUrl,
  dynamic header,
  String? api,
}) async {
  return http.delete(Uri.parse(url + api!), headers: {
    HttpHeaders.authorizationHeader: header,
  }).then((response) {
    // log("data ${response.body}");
    return {
      'code': response.statusCode,
      'content': response.body,
    };
  });
}

Future<Map<String, dynamic>> puttransimission({
  String url = appUrl,
  dynamic header,
  dynamic encodedReq,
  String? api,
}) async {
  return http.put(Uri.parse(url + api!), body: encodedReq, headers: {
    HttpHeaders.authorizationHeader: header,
  }).then((response) {
    // log("data ${response.body}");
    return {
      'code': response.statusCode,
      'content': response.body,
    };
  });
}

Future<Map<String, dynamic>> getDataTransimission({
  String url = appUrl,
  String? api,
}) async {
  return http.get(Uri.parse(url + api!)).then((response) {
    // log("data ${response.body}");
    return {
      'code': response.statusCode,
      'content': response.body,
    };
  });
}
