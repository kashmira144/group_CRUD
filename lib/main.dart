import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_crud/ui/add_update_group_type_screen.dart';
import 'package:group_crud/ui/group_type_listing_screen.dart';
import 'package:group_crud/utils/string_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: StringConstants.IS_SELECTED_FALSE,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => GroupTypeListingScreen()),
        GetPage(name: '/addGroupType', page: () => AddUpdateGroupTypeScreen()),
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: StringConstants.IS_SELECTED_TRUE,
      ),
    );
  }
}
