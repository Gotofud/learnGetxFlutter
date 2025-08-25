import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  RxInt hitung = 20.obs;

  void increment() {
    if (hitung >= 100) {
      Get.snackbar(
        "Stop",
        "Angka Tidak boleh lebih dari 100",
        backgroundColor: Colors.red,
        icon: Icon(Icons.warning, color: Colors.white),
        colorText: Colors.white,
      );
    } else {
      hitung++;
    }
  }

  void decrement() {
    if (hitung < 1) {
       Get.snackbar(
        "Stop",
        "Counter tidak boleh kurang dari 0",
        backgroundColor: Colors.red,
        icon: Icon(Icons.warning, color: Colors.white),
        colorText: Colors.white,
      );
    } else {
      hitung--;
    }
  }
}
