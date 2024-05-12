import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LokasiBengkelly extends StatefulWidget {
  const LokasiBengkelly({super.key});

  @override
  State<LokasiBengkelly> createState() => _LokasiBengkellyState();
}

class _LokasiBengkellyState extends State<LokasiBengkelly> {
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
