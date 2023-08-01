import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:taskmanager_ostad/data/models/response_object.dart';

class NetworkCaller {
  Future<NetworkResponse> getRequest(String url) async {
    try {
      Response response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        return NetworkResponse(true,response.statusCode, jsonDecode(response.body));
      } else {
        return NetworkResponse(false,response.statusCode, null);

      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(false,-1, null);
  }


}
