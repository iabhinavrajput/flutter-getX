import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CounterController extends GetxController {
  RxInt counter = 1.obs;
  incrementCounter() {
    counter.value++;
  }
}

class NotificationController extends GetxController {
  RxBool notification = false.obs;

  setNotification(bool value) {
    notification.value = value;
  }
}

class FavouriteController extends GetxController {
  RxList<String> fruits = ['orange', 'apple', 'mango', 'banana'].obs;
  RxList temp = [].obs;

  addTwoFavourite(String value) {
    temp.add(value);
  }

  removeTwoFavourite(String value) {
    temp.remove(value);
  }
}

class ImagePickerController extends GetxController {
  RxString imagePath = ''.obs;
  Future getImage() async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.camera);
    if(image != null) {
      imagePath.value = image.path.toString();
    }
  }
}