import 'package:ai_agent/ai_agent.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(
        child: AiAgent(
          shape: CircleBorder(),
          elevation: 10,
          padding: EdgeInsets.all(20),
          url: 'https://www.yavar.ai',
          child: Icon(
            Icons.smart_toy,
            size: 40,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
