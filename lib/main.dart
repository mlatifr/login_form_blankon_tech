import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future getData(username, password) async {
    print("run getData()");
    String usr = username.value.text;
    String pwd = password.value.text;
    final response = http.post(
        Uri.parse("https://dev-api-partners.blankontech.com/account/auth/"),
        // body: {'username': 'test@interview.com', 'password': '12345678'});
        body: {'username': '$usr', 'password': '$pwd'});
    print("response");
    // print(response);
    response.then((value) => print("${value.body}"));
    // print('Response status: ${response.}');
    // print('Response body: ${response.body}');
  }

  final username = TextEditingController();

  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          TextField(
            controller: username,
          ),
          TextField(
            controller: password,
          ),
          ElevatedButton(
              onPressed: () {
                print(
                    " controller login data: ${username.value.text} ${password.value.text}");

                getData(username, password);
              },
              child: Text("login"))
        ]),
      ),
    );
  }
}
