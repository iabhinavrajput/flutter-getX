import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenOne extends StatefulWidget {
  var name;
  ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GetX Screen one ' + Get.arguments[1])),

      body: Column(
        children: [
          Center(
            child: TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('Go back'),
            ),
          ),
        ],
      ),
    );
  }
}
