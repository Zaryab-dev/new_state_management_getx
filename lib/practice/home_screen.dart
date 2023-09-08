import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:new_state_management_getx/models/user_preferences/user_preference.dart';
import 'package:new_state_management_getx/practice/notification_controller.dart';
import 'package:new_state_management_getx/res/routes_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NotificationController notificationController = Get.put(NotificationController());
  int x = 0;
  UserPreferences userPreferences = UserPreferences();
  Color color = Colors.orange;
  @override
  Widget build(BuildContext context) {
    print('rebuild');
    return Scaffold(
          backgroundColor: color,
          appBar: AppBar(
            elevation: 2,
            title: const Text('ZARYAB'),
            actions: [
              IconButton(onPressed: () {
                userPreferences.removeUser().then((value) {
                  Get.toNamed(RoutesName.loginView);
                });
              }, icon: Icon(Icons.logout))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Card(
                  elevation: 12,
                  child: ListTile(
                    onTap: () {
                      Get.snackbar('Zaryab', 'Welcome Back!', backgroundColor: CupertinoColors.activeGreen,
                          snackPosition: SnackPosition.BOTTOM,
                          icon: Icon(Icons.favorite_border));
                    },
                    leading: Icon(Icons.favorite_border, color: Colors.red,),
                    title: Text('Zaryab'),
                    subtitle: Text('From Dera Ghazi Khan'),
                  ),
                ),
                Card(
                  elevation: 12,
                  child: ListTile(
                    onTap: () {
                      Get.defaultDialog(
                        backgroundColor: CupertinoColors.activeGreen,
                        title: 'Deleting!',
                        titlePadding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                        // confirm: IconButton(onPressed: () {}, icon: Icon(Icons.done_all_sharp)),
                        // cancel: IconButton(onPressed: () {}, icon: Icon(Icons.cancel_outlined)),
                        middleText: 'HEY! do you want to delete this?',
                        textConfirm: 'Ok',buttonColor: Colors.red,
                        textCancel: 'No'
                      );
                    },
                    leading: const Icon(Icons.favorite_border, color: Colors.red,),
                    title: const Text('No Name'),
                    subtitle: const Text('From Dera Ghazi Khan'),
                  ),
                ),
                Card(
                  elevation: 12,
                  child: ListTile(
                    onTap: () {
                      Get.bottomSheet(
                           SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                              child: Column(
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: const Divider(endIndent: 170,indent: 170,thickness: 4,color: Colors.white)),
                                  ListTile(
                                    onTap: () {
                                      Get.changeTheme(ThemeData.light());
                                      Get.back();
                                    },
                                    leading: Icon(Icons.light_mode_outlined),
                                    title: Text('Light Mode'),
                                  ),
                                  // const SizedBox(height: 10,),
                                  ListTile(
                                    onTap: () {
                                      Get.changeTheme(ThemeData.dark());
                                      Get.back();
                                    },
                                    leading: Icon(Icons.dark_mode_outlined),
                                    title: Text('Dark Mode'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          backgroundColor: Colors.green);
                    },
                    leading: const Icon(Icons.favorite_border, color: Colors.red,),
                    title: const Text('Show Bottom Sheet'),
                    subtitle: const Text('from getx'),
                  ),
                ),
                TextButton(onPressed: () {
                  Get.toNamed('/screenOne', arguments: [
                    'Zaryab',
                    '23'
                  ]);
                }, child: const Text("Go to Screen One")),
                const SizedBox(height: 50,),

                Obx(() {
                    return Switch(value: notificationController.notification.value, onChanged: (value) {
                      notificationController.setNotification(value);
                      notificationController.notification.value ? Get.changeTheme(ThemeData.light()) :  Get.changeTheme(ThemeData.dark());
                    });
                  }
                )
              ],
            ),
          ),
        );
      }
  }