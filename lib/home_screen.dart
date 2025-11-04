import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/screen_one.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GetX')),

      body: Column(
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

          Center(
            child: TextButton(
              onPressed: () {
                // Get.to(ScreenOne());
                Get.toNamed('/screenOne', arguments: ['Mac M1', 'Mac M2 Pro']);
              },
              child: Text('Go to next screen'),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
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
