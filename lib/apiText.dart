import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ApiText extends StatefulWidget {
  const ApiText({super.key});

  @override
  State<ApiText> createState() => _ApiTextState();
}

class _ApiTextState extends State<ApiText> {
  String resut = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                setState(() {});
                getdata().then((value) {
                  resut = value.body.toString().substring(0, 250);
                });
                setState(() {});
              },
              child: Text("Get Data"),
            ),
            const Spacer(),
            Text(resut),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Future<Response> getdata() async {
    const authority = 'www.googleapis.com';
    const path = '/books/v1/volumes/junbDwAAQBAJ';
    Uri url = Uri.https(authority, path);
    return http.get(url);
  }
}
