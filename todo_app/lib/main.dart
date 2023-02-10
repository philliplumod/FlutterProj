import 'package:flutter/material.dart';
import 'package:todo_app/main/todo.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
          colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
      home: const TaskAdd(),
    ));
