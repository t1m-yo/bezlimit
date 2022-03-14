import 'package:bezlimit/screens/input/input_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomeController extends GetxController {
  dynamic result;
  Set? coloringElementindexes;
  int? currentIndex;
  int itemsCount = 10;
  double rotate = 0.0;
  ScrollController? scrollController;
  ItemPositionsListener? itemPositionListener;
  ItemScrollController? itemScrollController;

  @override
  void onInit() {
    coloringElementindexes = {};
    currentIndex = result ?? 0;
    scrollController = ScrollController();
    scrollController?.addListener(pageScrollListener);
    itemScrollController = ItemScrollController();
    itemPositionListener = ItemPositionsListener.create();
    super.onInit();
  }

  void pageScrollListener() {
    rotate = math.pi * -(scrollController!.position.pixels * 0.01);
    if(scrollController!.position.pixels >= 299.0) {
      Get.showSnackbar(
        const GetSnackBar(
          message: 'Вы достигли предела страницы 😔',
          duration: Duration(seconds: 3),
        )
      );
    }
    update();
  }

 // Color getRandomColor ()=> Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

  selectElement (int currentIndex) async {
    dynamic resultTo = await Get.to(() => const InputScreen(),arguments: {'items_count': itemsCount,'current_index': currentIndex});
    result = resultTo;
    coloringElementindexes?.add(result);
    itemScrollController?.jumpTo(index: result);
    update();
  }
}