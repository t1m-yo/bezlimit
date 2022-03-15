import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


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
          message: 'Значение не может быть меньше 0',
          duration: Duration(seconds: 3),

        ));
  }
  else if(
  int.parse(textEditingController!.text)
      > arguments['items_count'] - 1
  ){
    Get.showSnackbar(
        GetSnackBar(
          message: 'Значение не может быть больше ${arguments['items_count'] - 1}',
          duration: const Duration(seconds: 3),
        ));
  }
  else {
    Get.back(result: int.parse(textEditingController!.text));
  }
    update();
  }
}
