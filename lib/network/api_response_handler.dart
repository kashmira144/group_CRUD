import 'dart:convert';

import 'package:group_crud/model/error_response.dart';
import 'package:group_crud/utils/number_constants.dart';
import 'package:http/http.dart' as http;

class ApiResponseHandler {
  response(dataResponse, successResponse) {
    print("Suc3esssuccessResponse--${dataResponse.statusCode}");

    if (dataResponse is http.Response) {
      switch (dataResponse.statusCode) {
        case NumberConstant.INT_TWO_HUNDRED:
        case NumberConstant.INT_TWO_HUNDRED_ONE:
          return successResponse;

        case NumberConstant.INT_FOUR_HUNDRED:
        case NumberConstant.INT_FOUR_HUNDRED_ONE:
        case NumberConstant.INT_FOUR_HUNDRED_FOUR:
        case NumberConstant.INT_FIVE_HUNDRED:
          ErrorResponse errorResponse =
              ErrorResponse.fromJson(jsonDecode(dataResponse.body.toString()));
          return errorResponse;
      }
    } else if (dataResponse is String) {
      return dataResponse;
    }
  }
}
