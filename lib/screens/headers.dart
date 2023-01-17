import 'package:flutter/material.dart';
import 'package:flutter_designs/controllers/controllers.dart';
import 'package:flutter_designs/widgets/widgets.dart';
import 'package:get/get.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({super.key});

  @override
  Widget build(BuildContext context) {
    CustomHeaderController headerController = Get.put(CustomHeaderController());
    return Scaffold(
      body: CustomHeader(headerType: headerController.headerKey.value),
    );
  }
}
