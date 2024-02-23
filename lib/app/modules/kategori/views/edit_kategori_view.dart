import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/app/data/models/kategori_model.dart';
import 'package:learn_getx/app/modules/kategori/controllers/kategori_controller.dart';

class EditKategoriView extends StatelessWidget {
  final Kategori kategoris;
  final KategoriController controller = Get.find();
  final TextEditingController nameController = TextEditingController();

  EditKategoriView({required this.kategoris}) {
    nameController.text = kategoris.name!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Kategori'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_validateInput()) {
                  controller.editKategori(
                    kategoris,
                    nameController.text,
                  );
                }
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }

  bool _validateInput() {
    if (nameController.text.isEmpty) {
      Get.snackbar('Error', 'Semua field harus diisi');
      return false;
    }
    return true;
  }
}