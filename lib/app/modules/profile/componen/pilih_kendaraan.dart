import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PilihKendaraan extends StatefulWidget {
  const PilihKendaraan({super.key});

  @override
  State<PilihKendaraan> createState() => _PilihKendaraanState();
}

class _PilihKendaraanState extends State<PilihKendaraan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          systemNavigationBarColor: Colors.white,
        ),
        title: const Text('ChatView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ChatView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
