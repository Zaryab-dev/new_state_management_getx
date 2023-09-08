

import 'package:get/get.dart';
import 'package:new_state_management_getx/data/status.dart';
import 'package:new_state_management_getx/models/home/user_list_model.dart';
import 'package:new_state_management_getx/repository/home_repository.dart';

class HomeController extends GetxController {

  final _api = HomeRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = UserListModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setListUser(UserListModel _value) => userList.value = _value;
  void setError(String _value) => error.value = _value;

  void getUserListApi() {

    _api.userListAPi().then((value) {
      setRxRequestStatus(Status.COMPLETE);
      setListUser(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
  void refreshApi() {
    setRxRequestStatus(Status.LOADING);

    _api.userListAPi().then((value) {
      setRxRequestStatus(Status.COMPLETE);
      setListUser(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}