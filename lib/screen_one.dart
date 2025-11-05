import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controller.dart';

class ScreenOne extends StatefulWidget {
  var name;
  ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GetX Screen one ' + Get.arguments[1])),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextFormField(
              controller: controller.emailController.value,
              decoration: InputDecoration(hintText: 'Email'),
            ),
            TextFormField(
              controller: controller.passwordController.value,
              decoration: InputDecoration(hintText: 'Password'),
            ),
            SizedBox(height: 20),

            Obx(() {
              return TextButton(
                onPressed: () {
                  controller.getLogin();
                },
                child: controller.loading.value ? CircularProgressIndicator() : Text('Login'),
              );
            }),
          ],
        ),
      ),
    );
  }
}
