
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  RxString image = ''.obs;

  Future getImage(ImageSource source) async{
    final ImagePicker imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: source);
    if(pickedImage != null) {
      image.value = pickedImage.path.toString();
      Get.snackbar('Success', "Image Selected Successfully!");
    }
    else{
      Get.snackbar('No Image Selected', 'Please select image to proceed');
    }
  }

}