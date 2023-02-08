import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(
        title: Text('Lorem Demo'),
      )),
      body: (Column(
        children: [LoremIpsim(), CheckboxDemo()],
      )),
    );
  }
}

class LoremIpsim extends StatelessWidget {
  const LoremIpsim({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (Text(
          'Lorem ipsum dolor sit amet consectetur. Eu platea nec diam ac a.')),
    );
  }
}

class CheckboxDemo extends StatelessWidget {
  const CheckboxDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxItem(
          label: 'Lorem',
        ),
        CheckboxItem(
          label: 'Ipsim',
        ),
        CheckboxItem(
          label: 'Dolor',
        ),
      ],
    );
  }
}

class CheckboxItem extends StatelessWidget {
  final String label;
  const CheckboxItem({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Checkbox(value: false, onChanged: null), Text(label)],
    );
  }
}
