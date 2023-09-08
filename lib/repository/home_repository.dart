


import 'package:new_state_management_getx/app_url/app_urls.dart';
import 'package:new_state_management_getx/data/network_api_services.dart';
import 'package:new_state_management_getx/models/home/user_list_model.dart';

class HomeRepository {
  final _apiServices = NetworkApiServices();

  Future<UserListModel> userListAPi() async{
    dynamic response = await _apiServices.getAPi(AppURl.userApiList);
    return UserListModel.fromJson(response);
  }
}