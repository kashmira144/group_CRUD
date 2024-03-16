import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_crud/controller/group_type_controller.dart';
import 'package:group_crud/ui/add_update_group_type_screen.dart';

class GroupTypeListingScreen extends StatelessWidget {
  final GroupTypeController controller = Get.put(GroupTypeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Group Types"),
      ),
      body: Obx(
        () => controller.groupTypeList.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : getGroupTypeListWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          controller.selectGroupType(-1);
          Get.to(
            () => AddUpdateGroupTypeScreen(),
            binding: BindingsBuilder(() {
              Get.put(GroupTypeController());
            }),
          );
        },
      ),
    );
  }

  getGroupTypeListWidget() {
    return ListView.builder(
      itemCount: controller.groupTypeList.length,
      itemBuilder: (context, index) {
        final groupType = controller.groupTypeList[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: ListTile(
              onTap: () {
                // Navigate to the next screen and pass the selected item data
                controller.selectGroupType(index);
                Get.to(
                  () => AddUpdateGroupTypeScreen(),
                  binding: BindingsBuilder(() {
                    Get.put(GroupTypeController());
                  }),
                );
              },

              title: Text(groupType.name),
              // adjust according to your data structure
              subtitle: Text(groupType
                  .description), // adjust according to your data structure
            ),
          ),
        );
      },
    );
  }
}
