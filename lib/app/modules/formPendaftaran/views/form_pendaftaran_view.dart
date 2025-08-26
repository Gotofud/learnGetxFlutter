import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/form_pendaftaran_controller.dart';

class FormPendaftaranView extends GetView<FormPendaftaranController> {
  const FormPendaftaranView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FormPendaftaranController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Pendaftaran'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Isi Data Anda',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            // Nama Lengkap
            Obx(() => TextField(
                  onChanged: (value) {
                    controller.name.value = value;
                    controller.validateName(name: value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Nama Lengkap',
                    hintText: 'Contoh: Chinatsu Kano',
                    errorText: controller.nameError.value.isNotEmpty
                        ? controller.nameError.value
                        : null,
                    border: const OutlineInputBorder(),
                  ),
                )),
            const SizedBox(height: 20),

            // Jenis Kelamin
            Obx(() => DropdownButtonFormField<String>(
                  value: controller.gender.value.isEmpty
                      ? null
                      : controller.gender.value,
                  items: ['Laki-Laki', 'Perempuan']
                      .map((gender) => DropdownMenuItem(
                            value: gender,
                            child: Text(gender),
                          ))
                      .toList(),
                  onChanged: (value) {
                    controller.gender.value = value ?? '';
                  },
                  decoration: InputDecoration(
                    labelText: 'Jenis Kelamin',
                    errorText: controller.genderError.value.isNotEmpty
                        ? controller.genderError.value
                        : null,
                    border: const OutlineInputBorder(),
                  ),
                )),
            const SizedBox(height: 20),

            // Tanggal Lahir
            Obx(() => GestureDetector(
                  onTap: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime(2000),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (selectedDate != null) {
                      controller.dateOfBirth.value = selectedDate;
                      controller.validateDateOfBirth(dateOfBirth: selectedDate);
                    }
                  },
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Tanggal Lahir',
                      errorText: controller.dateOfBirthError.value.isNotEmpty
                          ? controller.dateOfBirthError.value
                          : null,
                      border: const OutlineInputBorder(),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.dateOfBirth.value == null
                              ? 'Pilih tanggal'
                              : DateFormat('dd-MM-yyyy')
                                  .format(controller.dateOfBirth.value!),
                          style: const TextStyle(fontSize: 16),
                        ),
                        const Icon(Icons.calendar_today, size: 20),
                      ],
                    ),
                  ),
                )),
            const SizedBox(height: 20),

            // Nomor Telepon
            Obx(() => TextField(
                  onChanged: (value) {
                    controller.phone.value = value;
                    controller.validatePhone(phone: value);
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Nomor Telepon',
                    hintText: 'Contoh: 081234567890',
                    errorText: controller.phoneError.value.isNotEmpty
                        ? controller.phoneError.value
                        : null,
                    border: const OutlineInputBorder(),
                  ),
                )),
            const SizedBox(height: 30),

            // Tombol Submit
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: controller.submitForm,
                icon: const Icon(Icons.send),
                label: const Text('Kirim Data'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
