import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      body: Center(child: Text('Welcome to the Home Screen!')),
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
