import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_crud/controller/group_type_controller.dart';
import 'package:group_crud/utils/number_constants.dart';
import 'package:group_crud/utils/string_constants.dart';
import 'package:group_crud/utils/utils.dart';

class AddUpdateGroupTypeScreen extends StatelessWidget {
  final GroupTypeController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        hideKeyboard();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(_controller.title),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    autofocus: false,
                    style: TextStyle(fontSize: 15.0, color: Colors.black),
                    controller: _controller.nameController,
                    onChanged: (value) {
                      _controller.nameController.text = value;
                      _controller.groupType.update((val) {
                        val!.name = value;
                      });
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Name',
                      labelText: 'Name',
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 6.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black45),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: _controller.descriptionController,
                    onChanged: (value) {
                      _controller.descriptionController.text = value;
                      _controller.groupType.update((val) {
                        val!.description = value;
                      });
                    },
                    autofocus: false,
                    style: TextStyle(fontSize: 15.0, color: Colors.black),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Description',
                      labelText: 'Description',
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 6.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black45),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: NumberConstant.DOUBLE_SIXTEEN),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: NumberConstant.DOUBLE_FORTY,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side:
                                          BorderSide(color: Colors.black45)))),
                      onPressed: () async {
                        validate(context);
                      },
                      child: Text('Submit'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  validate(BuildContext context) async {
    if (_controller.groupType.value.name?.isEmpty ==
        StringConstants.IS_SELECTED_TRUE) {
      Get.snackbar("Please enter group type name", "",
          snackPosition: SnackPosition.BOTTOM);
      return false;
    } else if (_controller.groupType.value.description?.isEmpty ==
        StringConstants.IS_SELECTED_TRUE) {
      Get.snackbar("Please enter group type description", "",
          snackPosition: SnackPosition.BOTTOM);
      return false;
    } else {
      if (_controller.title == "Update Group Type") {
        try {
          await _controller
              .updateGroupTypes(
                  _controller.groupType.value.id,
                  _controller.groupType.value.name,
                  _controller.groupType.value.description)
              .then((value) => {
                    Get.back(),
                    Get.snackbar("Update Successfully.", "",
                        snackPosition: SnackPosition.BOTTOM),
                  })
              .catchError((onError) {
            Get.snackbar(onError.toString(), "",
                snackPosition: SnackPosition.BOTTOM);
          });
        } catch (exception) {
          Get.snackbar(exception.toString(), "",
              snackPosition: SnackPosition.BOTTOM);
        }
      } else {
        try {
          await _controller
              .addGroupTypes(_controller.groupType.value.name,
                  _controller.groupType.value.description)
              .then((value) => {
                    _controller.fetchGroupTypes(),
                    Get.back(),
                    Get.snackbar("Add Successfully.", "",
                        snackPosition: SnackPosition.BOTTOM),
                  })
              .catchError((onError) {
            Get.snackbar(onError.toString(), "",
                snackPosition: SnackPosition.BOTTOM);
          });
        } catch (exception) {
          Get.snackbar(exception.toString(), "",
              snackPosition: SnackPosition.BOTTOM);
        }
      }
    }
  }
}
