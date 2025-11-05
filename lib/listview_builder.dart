import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controller.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({super.key});

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  final FavouriteController controller = Get.put(FavouriteController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Listview Builder')),
      body: ListView.builder(
        itemCount: controller.fruits.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(controller.fruits[index]),
              trailing: Obx(
                () => Icon(
                  Icons.favorite,
                  color: controller.temp.contains((controller.fruits[index]))
                      ? Colors.red
                      : Colors.grey,
                ),
              ),
              onTap: () {
                if (controller.temp.contains((controller.fruits[index]))) {
                  controller.removeTwoFavourite((controller.fruits[index]));
                } else {
                  controller.addTwoFavourite((controller.fruits[index]));
                }
              },
            ),
          );
        },
      ),
    );
  }
}
