import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:group_crud/model/error_response.dart';
import 'package:group_crud/model/group_type_response.dart';
import 'package:group_crud/network/api_response_handler.dart';
import 'package:group_crud/network/api_service.dart';
import 'package:group_crud/utils/number_constants.dart';
import 'package:group_crud/utils/string_constants.dart';
import 'package:http/http.dart' as http;

class GroupTypeController extends GetxController {
  RxList groupTypeList = [].obs;
  var groupType = Rows(
          name: StringConstants.TEXT_EMPTY,
          description: StringConstants.TEXT_EMPTY,
          showDivisionReport: StringConstants.IS_SELECTED_TRUE)
      .obs;

  @override
  void onInit() {
    fetchGroupTypes();
    super.onInit();
  }

  Future<void> fetchGroupTypes() async {
    try {
      String groupTypeApiURL = "group-types?PageSize=50";
      var response = await ApiService().getApiCalling(groupTypeApiURL);
      if (response.statusCode == 200) {
        final List<dynamic> responseData =
            jsonDecode(response.body)['Data']['Rows'];
        groupTypeList
            .assignAll(responseData.map((data) => Rows.fromJson(data)));
      } else {
        throw Exception('Failed to load group types');
      }
    } catch (e) {
      print('Error fetching group types: $e');
    }
  }

  Future<void> updateGroupTypes(groupTypeId, dynamic body) async {
    try {
      String groupTypeApiURL = "group-types/$groupTypeId";
      var response = await ApiService().putApiCalling(groupTypeApiURL, body);
      print("updatedGroupType0---${response.statusCode}");

      if (response.statusCode == 200) {
        final updatedGroupType = Rows.fromJson(jsonDecode(response.body));
        final index =
            groupTypeList.indexWhere((element) => element.id == groupTypeId);
        if (index != -1) {
          groupTypeList[index] = updatedGroupType;
        }
      } else {
        throw Exception('Failed to load group types');
      }
    } catch (e) {
      print('Error fetching group types: $e');
    }
  }
}
