import 'package:flutter_designs/enums/custom_header.enum.dart';
import 'package:get/get.dart';

class CustomHeaderController extends GetxController {
  Rx<CustomHeaderKeyEnum> headerKey =
      Rx<CustomHeaderKeyEnum>(CustomHeaderKeyEnum.curve);
}
