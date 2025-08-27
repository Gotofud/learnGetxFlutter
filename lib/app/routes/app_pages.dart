import 'package:get/get.dart';

import '../modules/alQuran/bindings/al_quran_binding.dart';
import '../modules/alQuran/views/al_quran_view.dart';
import '../modules/counter/bindings/counter_binding.dart';
import '../modules/counter/views/counter_view.dart';
import '../modules/formPendaftaran/bindings/form_pendaftaran_binding.dart';
import '../modules/formPendaftaran/views/form_pendaftaran_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/post/bindings/post_binding.dart';
import '../modules/post/views/post_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.COUNTER,
      page: () => CounterView(),
      binding: CounterBinding(),
    ),
    GetPage(
      name: _Paths.FORM_PENDAFTARAN,
      page: () => FormPendaftaranView(),
      binding: FormPendaftaranBinding(),
    ),
    GetPage(
      name: _Paths.POST,
      page: () => PostView(),
      binding: PostBinding(),
    ),
    GetPage(
      name: _Paths.AL_QURAN,
      page: () => QuranView(),
      binding: AlQuranBinding(),
    ),
  ];
}
