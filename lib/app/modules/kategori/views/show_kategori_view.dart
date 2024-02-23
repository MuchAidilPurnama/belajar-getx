import 'package:flutter/material.dart';

import 'package:learn_getx/app/data/models/kategori_model.dart';

class ShowKategoriView extends StatelessWidget {
  final Kategori kategoris;

  ShowKategoriView({required this.kategoris});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Kategori'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama: ${kategoris.name}'),
          ],
        ),
      ),
    );
  }
}