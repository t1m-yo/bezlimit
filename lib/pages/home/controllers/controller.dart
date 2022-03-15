import 'package:bezlimit/pages/input/view/input.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomeController extends GetxController {
  dynamic result;
  Set? coloringElementIndexes;
  int? itemsCount;
  double? rotate;
  ScrollController? scrollController;
  ItemPositionsListener? itemPositionListener;
  ItemScrollController? itemScrollController;

  @override
  void onInit() {
    itemsCount = 10;
    rotate = 0.0;
    coloringElementIndexes = {};
    scrollController = ScrollController();
    scrollController?.addListener(pageScrollListener);
    itemScrollController = ItemScrollController();
    itemPositionListener = ItemPositionsListener.create();
    super.onInit();
  }

  pageScrollListener() {
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

  selectElement (int currentIndex) async {
    dynamic resultTo = await Get.to(() => InputPage(),arguments: {'items_count': itemsCount,'current_index': currentIndex});
    result = resultTo;
    if(coloringElementIndexes!.contains(result)){
      coloringElementIndexes!.remove(result);
      itemScrollController!.jumpTo(index: result);
    }
    else{
      coloringElementIndexes!.add(result);
      itemScrollController!.jumpTo(index: result);
    }
    update();
  }
}