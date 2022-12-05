import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/led_controller.dart';

class HomeView extends GetView<LEDController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark),
        title: const Text(
          'LED color controller',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Obx(() {
        return SizedBox(
          height: Get.height,
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Current Color: ${controller.currentColor}"),
              ColorContainer(
                  onTap: () async {
                    await controller.changeColor("red");
                  },
                  color: "Red",
                  containerColor: Colors.red),
              ColorContainer(
                  onTap: () async {
                    await controller.changeColor("blue");
                  },
                  color: "Blue",
                  containerColor: Colors.blue),
              ColorContainer(
                  onTap: () async {
                    await controller.changeColor("white");
                  },
                  color: "White",
                  containerColor: Colors.black),
            ],
          ),
        );
      }),
    );
  }
}

class ColorContainer extends StatelessWidget {
  final VoidCallback onTap;
  final String color;
  final Color containerColor;
  const ColorContainer(
      {super.key,
      required this.onTap,
      required this.color,
      required this.containerColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 100,
        width: 100,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: containerColor,
        ),
        child: Center(
          child: Text(
            color,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
