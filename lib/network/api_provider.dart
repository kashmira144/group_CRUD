import 'dart:convert';

import 'package:group_crud/utils/utils.dart';
import 'package:http/http.dart' as http;
import '../utils/string_constants.dart';

class ApiProvider {
  //GET API PROVIDER
  Future<dynamic> getApiProviderCall(String url) async {
    var responseJson;
    //Keeping this log statement for checking which api is getting called
    var isInternetActive = await isInternet();
    if (isInternetActive) {
      await http.get(Uri.parse(('${StringConstants.BASE_URL}$url')), headers: {
        // StringConstants.HEADER_PARAM_CONTENT_TYPE:
        //     StringConstants.HEADER_PARAM_APPLICATION_JSON,
        StringConstants.HEADER_PARAM_ACCEPT:
            StringConstants.HEADER_PARAM_APPLICATION_JSON,
      }).then((response) async {
        responseJson = response;
      }).catchError((onError) {
        return onError;
      });
      return responseJson;
    } else {
      return StringConstants.TEXT_INTERNET_CONNECTION_ERROR;
    }
  }

  //PUT API PROVIDER
  Future<dynamic> putApiProviderCall(String url, dynamic body) async {
    var responseJson;
    // dynamic header;
    Map<String, String> header = {
      StringConstants.HEADER_PARAM_CONTENT_TYPE:
          StringConstants.HEADER_PARAM_APPLICATION_JSON,
    };
    var isInternetActive = await isInternet();
    if (isInternetActive) {
      await http
          .patch(
              Uri.parse(
                ('${StringConstants.BASE_URL}$url'),
              ),
              body: jsonEncode(body),
              headers: header)
          .then((response) async {
        responseJson = response;
      }).catchError((onError) {
        return onError;
      });
      return responseJson;
    } else {
      return StringConstants.TEXT_INTERNET_CONNECTION_ERROR;
    }
  }

  //POST API PROVIDER
  Future<dynamic> postApiProviderCall(String url, dynamic body) async {
    var responseJson;
    // dynamic header;
    Map<String, String> header = {
      StringConstants.HEADER_PARAM_CONTENT_TYPE:
          StringConstants.HEADER_PARAM_APPLICATION_JSON,
    };
    var isInternetActive = await isInternet();
    if (isInternetActive) {
      await http
          .post(
              Uri.parse(
                ('${StringConstants.BASE_URL}$url'),
              ),
              body: jsonEncode(body),
              headers: header)
          .then((response) async {
        responseJson = response;
      }).catchError((onError) {
        return Future.error(onError());
      });
      return responseJson;
    } else {
      return StringConstants.TEXT_INTERNET_CONNECTION_ERROR;
    }
  }

  //DELETE API PROVIDER
  Future<dynamic> deleteApiProviderCall(String url) async {
    var responseJson;
    Map<String, String> header = {
      StringConstants.HEADER_PARAM_CONTENT_TYPE:
          StringConstants.HEADER_PARAM_APPLICATION_JSON,
      StringConstants.HEADER_PARAM_ACCEPT:
          StringConstants.HEADER_PARAM_APPLICATION_JSON,
    };
    var isInternetActive = await isInternet();
    if (isInternetActive) {
      await http
          .delete(
              Uri.parse(
                (StringConstants.BASE_URL + url),
              ),
              headers: header)
          .then((response) async {
        String error = await handleStatus(response.statusCode);
        if (error == StringConstants.TEXT_EMPTY) {
          responseJson = response;
        } else {
          responseJson = error;
        }
      }).catchError((onError) {
        return onError;
      });
      return responseJson;
    } else {
      return StringConstants.TEXT_INTERNET_CONNECTION_ERROR;
    }
  }
}
