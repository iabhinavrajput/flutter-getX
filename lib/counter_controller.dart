import 'package:get/get.dart';

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
