import 'package:flutter/material.dart';

class WidgetBookPage extends StatefulWidget {
  const WidgetBookPage({super.key});

  @override
  State<WidgetBookPage> createState() => _WidgetBookPageState();
}

class _WidgetBookPageState extends State<WidgetBookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Listagem de todos os componentes criados'),
        backgroundColor: Colors.deepPurple,
      ),
      body: const ListBody(
        children: [],
      ),
    );
  }
}
