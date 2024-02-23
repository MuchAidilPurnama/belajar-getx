import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:learn_getx/app/data/models/kategori_model.dart';

import '../controllers/kategori_controller.dart';
import 'create_kategori_view.dart';
import 'edit_kategori_view.dart';
import 'show_kategori_view.dart';

class KategoriView extends GetView<KategoriController> {
  const KategoriView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KategoriView'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Get.to(CreateKategoriView());
            },
          ),
        ],
      ),
      body: Obx(
        () => controller.kategoriList.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.kategoriList.length,
                itemBuilder: (context, index) {
                  var kategoris = controller.kategoriList[index];
                  return ListTile(
                    title: Text(kategoris.name.toString()),
                    onTap: () {
                      controller.showKategoriDetails(kategoris);
                    },
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            Get.to(() => EditKategoriView(kategoris: kategoris));
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.visibility),
                          onPressed: () {
                            Get.to(() => ShowKategoriView(kategoris: kategoris));
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            showDeleteConfirmation(context, kategoris);
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

  void showDeleteConfirmation(BuildContext context, Kategori kategori) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete kategori'),
          content: Text('Are you sure you want to delete ${kategori.name}?'),
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
                controller.deleteKategori(kategori);
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
