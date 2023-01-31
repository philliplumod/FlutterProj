import 'package:flutter/material.dart';

_tapbutton() {
  debugPrint('tap');
}

class ScaffoldExample extends StatelessWidget {
  const ScaffoldExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scaffold"),
        centerTitle: false,
        backgroundColor: Colors.blueAccent.shade700,
        actions: <Widget>[
          IconButton(
              onPressed: (() => debugPrint('Email Tapped!')),
              icon: const Icon(Icons.email)),
          const IconButton(onPressed: _tapbutton, icon: Icon(Icons.alarm))
        ],
      ),
      backgroundColor: Colors.amber.shade100,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: (() => debugPrint('Tapped....')),
              child: const Text(
                'Tap Me!',
                style: TextStyle(fontSize: 23.4),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: Colors.deepOrange,
      child: Center(
        child: Text(
          'Hello Wrld',
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 23.4,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );

    // return Center(
    //   child: const Text(
    //     'Hello World',
    //     textDirection: TextDirection.ltr,
    //   ),
    // );
  }
}
