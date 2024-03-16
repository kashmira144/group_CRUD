import 'dart:io';
import 'api_provider.dart';

class ApiService {
  //Post Api for user
  Future<dynamic> postApiCalling(String apiUrl, dynamic body) async {
    return await ApiProvider().postApiProviderCall(apiUrl, body);
  }

  Future<dynamic> getApiCalling(String apiUrl) async {
    return await ApiProvider().getApiProviderCall(apiUrl);
  }

  //Put Api for user
  Future<dynamic> putApiCalling(String apiUrl, dynamic body) async {
    return await ApiProvider().putApiProviderCall(apiUrl, body);
  }

  //Delete Api for user
  Future<dynamic> deleteApiCalling(String apiUrl) async {
    return await ApiProvider().deleteApiProviderCall(apiUrl);
  }
}
