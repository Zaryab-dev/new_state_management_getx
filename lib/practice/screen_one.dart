import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_state_management_getx/practice/counter_controller.dart';

import 'opacity_controller.dart';

class ScreenOne extends StatefulWidget {

  // var name;
   ScreenOne({super.key,});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  final controller = TextEditingController();
  final CounterController _counterController = Get.put(CounterController());
  final OpacityController _opacityController = Get.put(OpacityController());
  // double opacity = .43;
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
            return Text('Screen One ${Get.arguments[1]} ${_counterController.counter}');
          }
        ),centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: Get.width * .20,
            height: Get.height * .10,
            color: Colors.greenAccent.shade700,
            child: TextFormField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Enter'
              ),
            ),
          ),
          Center(child: TextButton(onPressed: () {
            Get.toNamed('/screenTwo', arguments: [
              controller.text,
            ]);
          }, child: const Text('Go To Screen Two'))),
          Center(child: TextButton(onPressed: () {
            Get.toNamed('/loginScreen', arguments: [
              controller.text,
            ]);
          }, child: const Text('Login'))),
          Center(
            child: Obx( () {
              print('rebuild');
              return Center(child: Text(_counterController.counter.toString(), style: const TextStyle(fontSize: 30),),);
            }
            ),
          ),
          Obx(
             () {
              return Container(
                height: _opacityController.opacity.value == 1 ? Get.height * .30 : Get.height * .25,
                decoration:  BoxDecoration(
                  color: _opacityController.opacity.value == 1 ? Colors.red : Colors.green.withOpacity(_opacityController.opacity.value),
                ),
              );
            }
          ),
          Obx(() => Slider(value: _opacityController.opacity.value, onChanged: (value) {
            _opacityController.setOpacity(value);
          }))
        ],
      ),floatingActionButton: FloatingActionButton(onPressed: () {

        _counterController.counterIncrement();

    }),
    );
  }
}
