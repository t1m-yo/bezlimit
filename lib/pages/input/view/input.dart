import 'package:bezlimit/pages/input/controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class InputPage extends StatelessWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<InputController>(
        init: InputController(),
        builder: (inputController){
          return Container(
            width: Get.width,
            height: Get.height,
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                      child: TextFormField(
                        autofocus: true,
                    keyboardType: TextInputType.number,
                    controller: inputController.textEditingController,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                  ),
                  ),
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () => inputController.validator(),
                    child: const Text('Сохранить'),
                  )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}