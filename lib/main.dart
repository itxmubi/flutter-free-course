import 'package:flutter/material.dart';

import 'Chapter3/chapter_3.dart';

const age = 20;

void main() {
  runApp(const MyApp());
}

Stream<String> getName() {
  return Stream.value("Mubashir");
}

void test() async {
  await for (final value in getName()) {
    print(value);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fl utter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Chatpter3(),
    );
  }
}
