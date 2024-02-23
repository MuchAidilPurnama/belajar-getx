// pasien_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/app/modules/pasien/views/create_pasien_view.dart';
import '../../../data/models/pasien_model.dart';
import '../controllers/pasien_controller.dart';
import 'edit_pasien_view.dart';
import 'show_pasien_view.dart';


class PasienView extends StatelessWidget {
  final PasienController controller = Get.put(PasienController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Pasien'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Get.to(() => TambahPasienView());
            },
          ),
        ],
      ),
      body: Obx(
        () => controller.pasienList.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.pasienList.length,
                itemBuilder: (context, index) {
                  var pasien = controller.pasienList[index];
                  return ListTile(
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(pasien.nama.toString()),
                        ),
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            Get.to(() => EditPasienView(pasien: pasien));
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.visibility),
                          onPressed: () {
                            Get.to(() => DetailPasienView(pasien: pasien));
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            // Show a confirmation dialog before deleting
                            showDeleteConfirmation(context, pasien);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }

  void showDeleteConfirmation(BuildContext context, Pasien pasien) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Pasien'),
          content: Text('Are you sure you want to delete ${pasien.nama}?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Call the deletePasien method from the controller
                controller.deletePasien(pasien);
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
