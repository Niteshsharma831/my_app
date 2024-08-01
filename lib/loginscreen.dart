import 'package:flutter/material.dart';

class MyLoginScreen extends StatefulWidget {
  const MyLoginScreen({super.key});

  @override
  State<MyLoginScreen> createState() => _MyLoginScreenState();
}

class _MyLoginScreenState extends State<MyLoginScreen> {
  String name = "";
  String password = "";
  bool islogged = false;

  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login Screen"),
        ),
        body: Center(
          child: islogged ? _buildSucess() : _buildLogin(),
        ));
  }

  Widget _buildSucess() {
    return const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        Icons.check,
        color: Colors.green,
      ),
      Text("Success"),
    ]);
  }

  Widget _buildLogin() {
    return Form(child: Column());
  }
}
