import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_crud/controller/group_type_controller.dart';
import 'package:group_crud/ui/add_update_group_type_screen.dart';
import 'package:group_crud/utils/vertical_title_subtitle_shimmer_widget.dart';

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

                controller.groupType.value = groupType;
                Get.to(
                  () => AddUpdateGroupTypeScreen(),
                )?.then((_) {
                  // Handle the update in list view after navigating back from the next screen
                  // For simplicity, this example just re-fetches the data
                  controller.fetchGroupTypes();
                });
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
