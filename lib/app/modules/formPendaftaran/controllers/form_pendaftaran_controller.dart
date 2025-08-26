import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/app/modules/formPendaftaran/views/results_screen_view.dart';

class FormPendaftaranController extends GetxController {
  // Variabel Reaktif untuk field form
  RxString name = ''.obs;
  RxString gender = ''.obs;
  Rxn<DateTime> dateOfBirth = Rxn<DateTime>();
  RxString phone = ''.obs;

  // Variabel untuk error validasi
  RxString nameError = ''.obs;
  RxString genderError = ''.obs;
  RxString dateOfBirthError = ''.obs;
  RxString phoneError = ''.obs;

  // Fungsi Validasi name
  void validateName({required String name}) {
    if (name.length < 3) {
      nameError.value = 'Nama Minimal 3 Karakter';
    }
    if (name.length > 6) {
      nameError.value = 'Nama Maximal 6 Karakter';
    } else {
      nameError.value = '';
    }
  }

  void validateGender({required String? gender}) {
    if (gender == null || gender.isEmpty) {
      genderError.value = 'Pilih Jenis Kelamin';
    } else {
      genderError.value = '';
    }
  }

  void validateDateOfBirth({required DateTime? dateOfBirth}) {
    if (dateOfBirth == null) {
      dateOfBirthError.value = 'Pilih Tanggal Lahir';
    } else {
      final now = DateTime.now();
      final age = now.year - dateOfBirth.year;
      if (age < 15) {
        dateOfBirthError.value = 'Umur Minimal 15 tahun';
      } else {
        dateOfBirthError.value = '';
      }
    }
  }

  void validatePhone({required String phone}) {
    if (!GetUtils.isPhoneNumber(phone)) {
      phoneError.value = 'nomor tidak valid';
    } else {
      phoneError.value = '';
    }
  }

  void submitForm() {
    validateName(name: name.value);
    validateDateOfBirth(dateOfBirth: dateOfBirth.value);
    validateGender(gender: gender.value);
    validatePhone(phone: phone.value);

    if (nameError.value.isEmpty &&
        genderError.value.isEmpty &&
        dateOfBirthError.value.isEmpty &&
        phoneError.value.isEmpty) {
      Get.to(
        () => ResultsScreenView(
          name: name.value,
          gender: gender.value,
          dateOfBirth: dateOfBirth.value!,
          phone: phone.value,
        ),
      );
    } else {
    Get.snackbar('Error', 'Periksa Input Anda');
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
