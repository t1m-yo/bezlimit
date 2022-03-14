import 'package:flutter/cupertino.dart';
import 'dart:math' as math;
import 'package:get/get.dart';

class HomeController extends GetxController {
  dynamic arguments = Get.arguments;
  int? currentIndex;
  int itemsCount = 10;
  double rotate = 0.0;
  ScrollController? scrollController;
  @override
  void onInit() {
    currentIndex = arguments ?? 0;
    scrollController = ScrollController();
    scrollController?.addListener(pageScrollListener);
    super.onInit();
  }

  void pageScrollListener() {
    rotate = math.pi * (scrollController!.position.pixels * 0.01);
    if(scrollController!.position.pixels >= 300.0) {
      Get.showSnackbar(
        const GetSnackBar(
          message: 'Вы достигли предела страницы 😔',
          duration: Duration(seconds: 5),
        )
      );
    }
    update();
  }
}