

import 'package:new_state_management_getx/app_url/app_urls.dart';
import 'package:new_state_management_getx/data/network_api_services.dart';

class LoginRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> loginAPi(var data) async{
    dynamic response = await _apiServices.postAPi(data, AppURl.loginURl);
    return response;
  }
}