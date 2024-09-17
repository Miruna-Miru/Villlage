import 'package:flutter/material.dart';
import 'package:village/Login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
        debugShowCheckedModeBanner: false
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  void _navigateToLoginPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),

      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _navigateToLoginPage(context),
          child: const Text('Go to Login Page'),
        ),
      ),
    );
  }
}

