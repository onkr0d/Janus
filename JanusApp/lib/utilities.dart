import 'dart:convert';

import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Utilities {
  static const String _url = '18.218.187.28';

  /// Send the new value [value] to the server.
  ///
  /// Send the new value [value] to the server using
  /// an HTTP POST request. Returns status code,
  /// or -1 if things went really wrong.
  static Future<int> updateServerValue(bool value) async {
    return 200;
    var body = json.encode(value);
    http.Response? response;
    var client = http.Client();

    try {
      response = await client.post(
          Uri(
              scheme: 'http',
              userInfo: '',
              host: _url,
              port: 6969,
              path: '/update'),
          body: body,
          headers: {'Content-type': 'application/json'});
    } catch (exception) {
      // Rip
      if (response != null) {
        return response.statusCode;
      }
      return -1;
    }
    return response.statusCode;
  }

  /// Show a flash bar in the current content with desired properties.
  static void showBar(
      BuildContext context, String text, Icon icon, Color color) {
    context.showFlashBar(
        content: Text(text),
        icon: icon,
        position: FlashPosition.top,
        duration: const Duration(seconds: 1, milliseconds: 500),
        indicatorColor: color);
  }
}
