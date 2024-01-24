import 'package:flutter/material.dart';
import 'package:respon2_0036/form/input_mobil.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Mobil'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: const Text('data not found. . .'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const InputHp()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
