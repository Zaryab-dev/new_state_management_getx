
abstract class BaseApiURl {
  Future<dynamic> getAPi(String url);
  Future<dynamic> postAPi(var data,String url);
}