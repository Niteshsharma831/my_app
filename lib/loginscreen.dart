import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
  final _emailController = TextEditingController();
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
    return Form(
      key: _formkey,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Username"),
              validator: (Text) => Text!.isEmpty ? "Enter Name" : null,
            ),
            TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: "Email Address"),
                validator: (text) {
                  if (text!.isEmpty) {
                    return "Email cannot be Empity";
                  }
                  final regex = RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$");
                  if (!regex.hasMatch(text)) {
                    return "Invalid Email";
                  }
                  return null;
                }),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: validate, child: Text("Login"))
          ],
        ),
      ),
    );
  }

  void validate() {
    final Form = _formkey.currentState;
    if (Form?.validate() == false) {
      return;
    }
    setState(() {
      islogged = true;
      name = _nameController.text;
      password = _emailController.text;
    });
  }
}
