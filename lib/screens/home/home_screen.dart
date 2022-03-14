import 'package:bezlimit/screens/home/home_controler.dart';
import 'package:bezlimit/screens/input/input_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (homeController) {
          return Stack(
              children: [
                Positioned(
                  left: -120,
                  top: -50,
                    child: Transform.rotate(
                      angle: homeController.rotate,
                      child: SvgPicture.asset('assets/circle.svg', width: 300,),
                    )
                ),
                SizedBox(
                  width: Get.width,
                  height: Get.height,
                  child:  SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    controller: homeController.scrollController,
                    child: Column(
                      children: [
                        const SizedBox(height: 300,),
                        Container(
                          width: Get.width,
                          height: Get.height,
                          padding: const EdgeInsets.only(
                              left: 15,
                              right: 15,
                              top: 20
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)
                            )
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              roundedLine(Get.width / 1.5),
                              const SizedBox(height: 20,),
                              roundedLine(Get.width / 1.2),
                              const SizedBox(height: 20,),
                              roundedLine(Get.width / 1.7),
                              const SizedBox(height: 70,),
                              SizedBox(
                                width: Get.width,
                                height: 100,
                                child: ScrollablePositionedList.builder(
                                    initialScrollIndex: homeController.currentIndex!,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: homeController.itemsCount,
                                    itemBuilder: (context,index){
                                      return Padding(
                                        padding: const EdgeInsets.only(right: 10),
                                        child: squircle(
                                            color: (homeController.arguments != null && index == homeController.arguments) ? Colors.green : Colors.white,
                                            onTap: () => Get.off(()=>const InputScreen(),arguments: {'items_count': homeController.itemsCount,'current_index': index})
                                        ),
                                      );
                                    })
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
        }
      )
    );
  }

  Widget roundedLine(double width){
    return Container(
      width: width,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.8),
            Colors.white,
            Colors.white.withOpacity(0.8),
          ]
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
    );
  }

  Widget squircle({
    required VoidCallback onTap,
    required Color color,
  }){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.black,width: 0.4),
          borderRadius: BorderRadius.circular(15)
        ),
      ),
    );
  }
}
