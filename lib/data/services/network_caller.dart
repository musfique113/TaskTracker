import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class NetworkCaller {
  Future<Map<String, dynamic>?> getRequest(String url) async {
    Map<String, dynamic>? decodedResponse;

    try {
      Response response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        decodedResponse = jsonDecode(response.body);
      } else {

      }
    } catch (e) {
      log(e.toString());
    }
    return decodedResponse;
  }
}
