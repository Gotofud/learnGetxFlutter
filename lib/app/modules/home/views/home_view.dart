import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomeView'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('HomeView is working', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                FloatingActionButton(
                  heroTag: "Form Pendaftaran",
                  onPressed: () => Get.toNamed('/form-pendaftaran'),
                  child: Icon(Icons.home),
                ),
                FloatingActionButton(
                  heroTag: "Counter",
                  onPressed: () => Get.toNamed('/counter'),
                  child: Icon(Icons.calculate),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
