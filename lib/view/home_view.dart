import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_state_management_getx/data/app_exception.dart';
import 'package:new_state_management_getx/data/status.dart';
import 'package:new_state_management_getx/models/user_preferences/user_preference.dart';
import 'package:new_state_management_getx/res/internet_exception.dart';
import 'package:new_state_management_getx/res/routes_name.dart';
import 'package:new_state_management_getx/utils/utils.dart';
import 'package:new_state_management_getx/view/details.dart';
import 'package:new_state_management_getx/view_model/home_view_model.dart';

class HomeScreenTwo extends StatefulWidget {
  const HomeScreenTwo({super.key});

  @override
  State<HomeScreenTwo> createState() => _HomeScreenTwoState();
}

class _HomeScreenTwoState extends State<HomeScreenTwo> {
  HomeController homeController = Get.put(HomeController());
  UserPreferences userPreferences = UserPreferences();

  @override
  void initState() {
    super.initState();
    homeController.getUserListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('User List'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            userPreferences.removeUser().then((value) {
              Get.toNamed(RoutesName.loginView);
            }).onError((error, stackTrace) {
              Utils.showSnackbar('Error', 'error while logout!');
            });
          }, icon: Icon(Icons.logout))
        ],
      ),
      body: Obx(() {
        switch (homeController.rxRequestStatus.value) {
          case Status.LOADING:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case Status.ERROR:
            if(homeController.error.value != 'No Internet' ){
              return InternetExceptionWidget(onPress: () {
                homeController.refreshApi(); },);
            }
            else{
              return InternetExceptionWidget(onPress: () {
                homeController.refreshApi(); },);
            }
          case Status.COMPLETE:
            return Center(
              child: ListView.builder(
                  itemCount: homeController.userList.value.data!.length,
                  itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () {
                      Get.to(DetailScreen(name: homeController.userList.value.data![index].firstName.toString(),
                        photoUrl: homeController.userList.value.data![index].avatar.toString(),
                        email: homeController.userList.value.data![index].email.toString(),
                        lastname: homeController.userList.value.data![index].lastName.toString(),));
                    },
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(homeController.userList.value.data![index].avatar.toString()),
                    ),
                    title: Text(homeController.userList.value.data![index].firstName.toString()),
                    subtitle: Text(homeController.userList.value.data![index].email.toString()),
                    trailing: Text(homeController.userList.value.data![index].lastName.toString()),
                  ),
                );
              }),
            );
        }
      }),
    );
  }
}
