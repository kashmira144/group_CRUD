import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_crud/controller/group_type_controller.dart';
import 'package:group_crud/model/group_type_response.dart';
import 'package:group_crud/utils/edit_text_field.dart';
import 'package:group_crud/utils/number_constants.dart';
import 'package:group_crud/utils/utils.dart';

class AddUpdateGroupTypeScreen extends StatelessWidget {
  final GroupTypeController _controller = Get.find();

  // final GroupTypeController _controller = Get.put(GroupTypeController());
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        hideKeyboard();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add Group type'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WidgetEditTextField(
                  controller: TextEditingController(
                      text: _controller.groupType.value.name),
                  onChanged: (value) {
                    _controller.groupType.update((val) {
                      val!.name = value;
                    });
                  },
                  focusNode: focusNode,
                  textFieldHint: "Name",
                  textInputType: TextInputType.name,
                  onSubmitField: () {},
                ),
                WidgetEditTextField(
                  controller: TextEditingController(
                      text: _controller.groupType.value.description),
                  onChanged: (value) {
                    _controller.groupType.update((val) {
                      val!.description = value;
                    });
                  },
                  focusNode: focusNode,
                  textFieldHint: "Description",
                  textInputType: TextInputType.name,
                  onSubmitField: () {},
                ),
                const SizedBox(height: NumberConstant.DOUBLE_SIXTEEN),
                SizedBox(
                  width: double.infinity,
                  height: NumberConstant.DOUBLE_FORTY,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (validate()) {
                        var body = {
                          "Name": _controller.groupType.value.name,
                          "Description":
                              _controller.groupType.value.description,
                          "ShowDivisionReport": true,
                          "IsActive": true
                        };
                        await _controller.updateGroupTypes(
                            _controller.groupType.value.id, body);
                      }
                    },
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validate() {
    if (_controller.groupType.value.name == "") {
      return false;
    } else if (_controller.groupType.value.description == "") {
      return false;
    }
    return true;
  }
}
