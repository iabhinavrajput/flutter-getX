import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controller.dart';
import 'package:getx_demo/listview_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CounterController controller = Get.put(CounterController());
  final NotificationController notificationController = Get.put(
    NotificationController(),
  );
  ImagePickerController imagePickerController = Get.put(
    ImagePickerController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GetX')),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.blue[200],
              height: Get.height * .2,
              child: Center(child: Text('center')),
            ),

            Card(
              child: ListTile(
                title: Text('GetX dialog alert'),
                subtitle: Text('Click to show GetX dialog alert'),
                onTap: () {
                  Get.defaultDialog(
                    title: 'GetX Dialog',
                    middleText: 'This is a GetX dialog alert',
                    confirm: TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text('OK'),
                    ),
                  );
                },
              ),
            ),

            Card(
              child: ListTile(
                title: Text('GetX dialog Theme change'),
                subtitle: Text('Click to change the theme'),
                onTap: () {
                  Get.bottomSheet(
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue[200],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(Icons.light_mode),
                            title: Text('light theme'),
                            onTap: () {
                              Get.changeTheme(ThemeData.light());
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.dark_mode),
                            title: Text('Dark mode'),
                            onTap: () {
                              Get.changeTheme(ThemeData.dark());
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            ListTile(title: Text('message'.tr), subtitle: Text("name".tr)),
            SizedBox(height: 20),

            Row(
              children: [
                OutlinedButton(
                  onPressed: () {
                    Get.updateLocale(Locale('en', 'US'));
                  },
                  child: Text('eng'),
                ),
                OutlinedButton(
                  onPressed: () {
                    Get.updateLocale(Locale('hi', 'IN'));
                  },
                  child: Text('hindi'),
                ),
              ],
            ),

            Center(child: Obx(() => Text(controller.counter.toString()))),
            FloatingActionButton(
              heroTag: 'incrementFab',
              onPressed: () {
                controller.incrementCounter();
              },
            ),

            Row(
              children: [
                Text('Notifications'),
                Obx(
                  () => Switch(
                    value: notificationController.notification.value,
                    onChanged: (value) {
                      notificationController.setNotification(value);
                    },
                  ),
                ),
              ],
            ),

            Obx(() {
              return Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: imagePickerController.imagePath.isNotEmpty
                        ? FileImage(
                            File(imagePickerController.imagePath.toString()),
                          )
                        : null,
                  ),
                  TextButton(
                    onPressed: () {
                      imagePickerController.getImage();
                    },
                    child: Text('Pick image'),
                  ),
                ],
              );
            }),

            Row(
              children: [
                TextButton(
                  onPressed: () {
                    // Get.toNamed('/screenTwo');
                    Get.to(() => ScreenTwo());
                  },
                  child: Text('ListView Builder'),
                ),
                TextButton(
                  onPressed: () {
                    // Get.to(ScreenOne());
                    Get.toNamed(
                      '/screenOne',
                      arguments: ['Mac M1', 'Mac M2 Pro'],
                    );
                  },
                  child: Text('Go to next screen'),
                ),
              ],
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        heroTag: 'messageFab',
        child: Icon(Icons.message),
        onPressed: () {
          Get.snackbar(
            'Hello',
            'This is a GetX Snackbar',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.blue[200],
          );
        },
      ),
    );
  }
}
