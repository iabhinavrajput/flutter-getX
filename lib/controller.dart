import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
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
    if (image != null) {
      imagePath.value = image.path.toString();
    }
  }
}

class LoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  RxBool loading = false.obs;

  void getLogin() async {
    loading.value = true;
    try {
      final response = await post(
        Uri.parse('https://nxeducation.com/api/User/login'),
        body: {
          'email': emailController.value.text,
          'password': passwordController.value.text,
        },
      );

      print(response.statusCode);
      var data = jsonDecode(response.body);
      print(data);

      if (response.statusCode == 200) {
        loading.value = false;
        Get.snackbar('Login Success', data['message']);
      } else {
        loading.value = false;
        Get.snackbar('Login Failed', data.toString());
      }
    } catch (e) {
      loading.value = false;
      Get.snackbar('Exception', e.toString());
    }
  }
}
