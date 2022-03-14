import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../home/home_screen.dart';

class InputController extends GetxController {
  dynamic arguments = Get.arguments;
  TextEditingController? textEditingController;
  @override
  void onInit() {
    textEditingController = TextEditingController(
      text: arguments['current_index'].toString()
    );
    super.onInit();
  }
  validator(){
    if(textEditingController!.text.isEmpty){
    Get.showSnackbar(
        const GetSnackBar(
          message: 'Поле не может быть пустым',
          duration: Duration(seconds: 3),
        ));
  }
  else if(
  int.parse(textEditingController!.text)
      < 0
  ){
    Get.showSnackbar(
        const GetSnackBar(
          message: 'Значение не может быть меньше 1',
          duration: Duration(seconds: 3),

        ));
  }
  else if(
  int.parse(textEditingController!.text)
      > arguments['items_count']
  ){
    Get.showSnackbar(
        GetSnackBar(
          message: 'Значение не может быть больше ${arguments['items_count']}',
          duration: const Duration(seconds: 3),
        ));
  }
  else {
    Get.off(()=>const HomeScreen(),arguments: int.parse(textEditingController!.text));
  }
    update();
  }
}
