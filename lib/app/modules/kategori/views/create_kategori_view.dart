import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/app/modules/kategori/controllers/kategori_controller.dart';

class CreateKategoriView extends StatelessWidget {
  final KategoriController controller = Get.find<KategoriController>();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Kategori'),
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
                  controller.tambahKategori(nameController.text);
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