import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:study_case/model/exercies.dart';

// 'X-RapidAPI-Key' : 'bc5801af03msh83aa279d7b8bed2p17942cjsn60d99e60b757'
// 'X-RapidAPI-Host' : 'exercises-by-api-ninjas.p.rapidapi.com'

class ApiServices {
  static String _apiKey = 'bc5801af03msh83aa279d7b8bed2p17942cjsn60d99e60b757';
  static String _apiHost = 'exercises-by-api-ninjas.p.rapidapi.com';
  static String _path = '/v1/exercises';

  static Future<dynamic> fetchExercies({
    required String name,
    String type = '',
    String muscle = '',
  }) async {
    String _responseBody = await _sendRequest(
        url: Uri.https(_apiHost, _path, {
          'name': name,
          'type': type,
          'muscle': muscle,
        }),
        requestType: RequestType.GET,
        headers: {
          'X-RapidAPI-Key': _apiKey,
          'X-RapidAPI-Host': _apiHost,
        });
    log(_responseBody);
    if (_responseBody == "-1") {
      return {'status': "-1", 'text': "İnternet bağlantınızı kontrol ediniz."};
    } else if (_responseBody != "0") {
      if (_responseBody.isNotEmpty) {
        return List<ExerciesModel>.from(
            json.decode(_responseBody).map((x) => ExerciesModel.fromJson(x)));
      }
    }
    return {'status': "0", 'text': "İstek gönderimi başarısız"};
  }

  static Future<String> _sendRequest({
    required Uri url,
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
    RequestType requestType = RequestType.POST,
  }) async {
    bool isConnect = await isInternetConnection();
    if (!isConnect) {
      return "-1";
    }
    log(url.toString());
    http.Response response = requestType == RequestType.GET
        ? await http.get(
            url,
            headers: headers,
          )
        : await http.post(
            url,
            body: body,
            encoding: encoding,
            headers: headers,
          );
    if (response.statusCode == 200) {
      var _body = await response.body;
      return _body;
    } else {
      log("İstek gönderme başarısız. Hata Kodu: (${response.statusCode})");
    }
    return "0";
  }

  static Future<bool> isInternetConnection() async {
    bool status = false;
    try {
      var result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        status = true;
      }
    } catch (_) {
      log(_.toString());
      status = false;
    } finally {
      return status;
    }
  }
}

enum RequestType {
  GET,
  POST,
}
