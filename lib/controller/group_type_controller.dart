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
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  late int selectedIndex;
  late String title = "Add Group Type";
  var groupType = Rows(
          id: -1,
          name: StringConstants.TEXT_EMPTY,
          description: StringConstants.TEXT_EMPTY,
          showDivisionReport: StringConstants.IS_SELECTED_TRUE,
          isActive: StringConstants.IS_SELECTED_TRUE)
      .obs;

  @override
  void onInit() {
    fetchGroupTypes();
    super.onInit();
  }

  Future<void> fetchGroupTypes() async {
    try {
      String groupTypeApiURL = "group-types?IsDescending=true&PageSize=100";
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

  void selectGroupType(int index) {
    if (index == -1) {
      title = "Add Group Type";
      selectedIndex = index;
      groupType = Rows(
              id: -1,
              name: StringConstants.TEXT_EMPTY,
              description: StringConstants.TEXT_EMPTY,
              showDivisionReport: StringConstants.IS_SELECTED_TRUE,
              isActive: StringConstants.IS_SELECTED_TRUE)
          .obs;
      nameController.text = groupType.value.name.toString();
      descriptionController.text = groupType.value.description.toString();
    } else {
      title = "Update Group Type";
      selectedIndex = index;
      groupType.value = groupTypeList[index];
      nameController.text = groupType.value.name.toString();
      descriptionController.text = groupType.value.description.toString();
    }
  }

  Future<dynamic> updateGroupTypes(
      groupTypeId, groupTypeName, groupTypeDescription) async {
    try {
      String groupTypeApiURL = "group-types/$groupTypeId";
      var body = {
        "Name": groupTypeName,
        "Description": groupTypeDescription,
        "ShowDivisionReport": StringConstants.IS_SELECTED_TRUE,
        "IsActive": StringConstants.IS_SELECTED_TRUE,
      };
      var response = await ApiService().putApiCalling(groupTypeApiURL, body);
      if (response.statusCode == 200) {
        groupTypeList[selectedIndex] = Rows(
          id: groupTypeId,
          name: groupTypeName,
          description: groupTypeDescription,
          showDivisionReport: StringConstants.IS_SELECTED_TRUE,
          isActive: StringConstants.IS_SELECTED_TRUE,
        );
      } else {
        throw Exception('Failed to load group types');
      }
    } catch (e) {
      print('Error fetching group types: $e');
    }
  }

  Future<dynamic> addGroupTypes(groupTypeName, groupTypeDescription) async {
    try {
      String groupTypeApiURL = "group-types";
      var body = {
        "Name": groupTypeName,
        "Description": groupTypeDescription,
        "ShowDivisionReport": StringConstants.IS_SELECTED_TRUE,
        "IsActive": StringConstants.IS_SELECTED_TRUE,
      };
      var response = await ApiService().postApiCalling(groupTypeApiURL, body);
      if (response.statusCode == 200 || response.statusCode == 201) {
      } else {
        throw Exception('Failed to load group types');
      }
    } catch (e) {
      print('Error fetching group types: $e');
    }
  }
}
