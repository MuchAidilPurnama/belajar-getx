import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../controllers/cart_controller.dart';

class cartOutput extends StatelessWidget {
  final CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Information'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nama Lengkap: ${controller.namalengkap.value}'),
            Text('Tempat Lahir: ${controller.tempatlahir.value}'),
            Text('Tanggal Lahir: ${controller.selectedDate.value}'),
             Obx(() {
                              return Text(
                                "Age: ${controller.age}",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              );
                            }),
            Text('Gender: ${controller.gender.value}'),
            Text('Email: ${controller.email.value}'),
            Text('Negara: ${controller.negara.value}'),
            Text('Jenis Member: ${controller.selectedMember.value}'),
            Text('Nomor Kartu: ${controller.nomorkartu.value}'),
            Text('Tanggal Expired: ${controller.tanggalExpired.value}'),
            Text('Harga Member: ${controller.totalHarga.value}'),
            Text('Benefit: ${controller.benefit.value}'),
          ],
        ),
      ),
    );
  }
}
