import 'dart:developer';

import 'package:http/http.dart' as http;

class ServiceHelper {
  static Future<String> get(String url) async {
    try {
      final http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return 'Error';
      }
    } catch (e) {
      log(e.toString());
      return 'Error';
    }
  }
}
