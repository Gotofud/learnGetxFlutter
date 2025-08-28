import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/app/modules/alQuran/views/al_quran_view.dart';
import 'package:learn_getx/app/modules/counter/views/counter_view.dart';
import 'package:learn_getx/app/modules/formPendaftaran/views/form_pendaftaran_view.dart';
import 'package:learn_getx/app/modules/post/views/post_view.dart';
import 'package:learn_getx/app/modules/profile/views/profile_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  final List<Widget> pages = [
    CounterView(),
    FormPendaftaranView(),
    PostView(),
    QuranView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Obx(() {
          return pages[controller.selectedIndex.value];
        }),
      ),
      bottomNavigationBar: ConvexAppBar(
        items: const [
          TabItem(icon: Icons.exposure, title: 'counter'),
          TabItem(icon: Icons.description_outlined, title: 'Form'),
          TabItem(icon: Icons.newspaper, title: 'Post'),
          TabItem(icon: Icons.book, title: 'Al Quran'),
          TabItem(icon: Icons.person_rounded, title:  'Profile')
        ],
        initialActiveIndex: controller.selectedIndex.value,
        onTap: controller.changePage,
      ),
    );
  }
}
