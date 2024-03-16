import 'package:flutter/material.dart';
import 'package:group_crud/utils/number_constants.dart';
import 'package:group_crud/utils/string_constants.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

hideKeyboard() {
  return FocusManager.instance.primaryFocus?.unfocus();
}

Future<bool> isInternet() async {
  try {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      bool hasConnection =
          await Connectivity().checkConnectivity() != ConnectivityResult.none;
      return hasConnection;
    } else {
      return false;
    }
  } catch (e) {
    print('Error checking internet connection: $e');
    return false;
  }
}

Future<String> handleStatus(statusCode) async {
  switch (statusCode) {
    case NumberConstant.INT_FIVE_HUNDRED:
    case NumberConstant.INT_FIVE_HUNDRED_ONE:
    case NumberConstant.INT_FIVE_HUNDRED_TWO:
    case NumberConstant.INT_FIVE_HUNDRED_THREE:
    case NumberConstant.INT_FIVE_HUNDRED_FOUR:
    case NumberConstant.INT_FIVE_HUNDRED_FIVE:
      return StringConstants.TEXT_INTERNAL_SERVER_ERROR;
    default:
      return StringConstants.TEXT_EMPTY;
  }
}
