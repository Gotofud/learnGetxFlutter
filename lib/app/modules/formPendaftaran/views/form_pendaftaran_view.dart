import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/form_pendaftaran_controller.dart';

class FormPendaftaranView extends GetView<FormPendaftaranController> {
  const FormPendaftaranView({super.key});
  @override
  Widget build(BuildContext context) {
    final FormPendaftaranController controller = Get.put(
      FormPendaftaranController(),
    );
    return Scaffold(
      appBar: AppBar(title: Text('FormPendaftaranView'), centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16.0),
          child: Column(
            children: [
              Obx(
                () => TextField(
                  onChanged: (value) {
                    controller.name.value = value;
                    controller.validateName(name: value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Nama Lengkap',
                    errorText: controller.nameError.value.isNotEmpty
                        ? controller.nameError.value
                        : null,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Obx(
                () => DropdownButtonFormField<String>(
                  value: controller.gender.value.isEmpty
                      ? null
                      : controller.gender.value,
                  hint: Text('Pilih Jenis Kelamin'),
                  items: ['Laki-Laki', 'Perempuan']
                      .map(
                        (gender) => DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    controller.gender.value = value ?? '';
                  },
                  decoration: InputDecoration(
                    labelText: 'Jenis Kelamin',
                    errorText: controller.genderError.value.isNotEmpty
                        ? controller.genderError.value
                        : null,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Obx(
                () => ListTile(
                  title: Text(
                    controller.dateOfBirth.value == null
                        ? 'Pilih Tanggal Lahir'
                        : DateFormat(
                            'dd-MM-yyyy',
                          ).format(controller.dateOfBirth.value!),
                  ),
                  trailing: Icon(Icons.calendar_today),
                  onTap: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (selectedDate != null) {
                      controller.dateOfBirth.value = selectedDate;
                      controller.validateDateOfBirth(dateOfBirth: selectedDate);
                    }
                  },
                  subtitle: controller.dateOfBirthError.value.isNotEmpty
                      ? Text(
                          controller.dateOfBirthError.value,
                          style: TextStyle(color: Colors.red),
                        )
                      : null,
                ),
              ),
              SizedBox(height: 20),
              Obx(
                () => TextField(
                  onChanged: (value) {
                    controller.phone.value = value;
                    controller.validatePhone(phone: value);
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Nomor Telepon',
                    errorText: controller.phoneError.value.isNotEmpty
                        ? controller.phoneError.value
                        : null,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  controller.submitForm();
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
