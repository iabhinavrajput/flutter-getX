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