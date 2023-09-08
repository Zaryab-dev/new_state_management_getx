
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  RxList<String> fruitList = ['Orange', 'Apple', 'Banana', 'Chery'].obs;
  RxList tempFruitList = [].obs;

  addToFavorite(String value) {
    tempFruitList.add(value);
  }
  removeFromFavorite(String value) {
    tempFruitList.remove(value);
  }

}