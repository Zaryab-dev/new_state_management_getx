import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import 'counter_controller.dart';
import 'favorite_controller.dart';
import 'image_controller.dart';

class ScreenThree extends StatefulWidget {
  const ScreenThree({super.key});

  @override
  State<ScreenThree> createState() => _ScreenThreeState();
}

class _ScreenThreeState extends State<ScreenThree> {

  FavoriteController controller = Get.put(FavoriteController());
  ImageController imageController = Get.put(ImageController());

  @override
  Widget build(BuildContext context) {
    print('rebuild');
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: Get.height * .4,
            child: ListView.builder(
                itemCount: controller.fruitList.length,
                itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  onTap: () {
                    if(controller.tempFruitList.contains(controller.fruitList[index].toString())) {
                      controller.removeFromFavorite(controller.fruitList[index].toString());
                    }else{
                      controller.addToFavorite(controller.fruitList[index].toString());
                    }
                  },
                  title: Text(controller.fruitList[index].toString()),
                  trailing: Obx(() {
                      return Icon(Icons.favorite_border,color: controller.tempFruitList.contains(controller.fruitList[index].toString()) ? Colors.red: Colors.grey );
                    }
                  ),
                ),
              );
            }),
          ),
          Obx( () {
              return Column(
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: imageController.image.isNotEmpty ? FileImage(File(imageController.image.value)) : null),
                  TextButton(onPressed: () {
                    imageController.getImage(ImageSource.gallery);
                  }, child: Text('Pick Image'))
                ],
              );
            }
          )
        ],
      ),
    );
  }
}
