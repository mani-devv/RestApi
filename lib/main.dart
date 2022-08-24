import 'package:api_tutor_1/example_four.dart';
import 'package:api_tutor_1/example_three.dart';
import 'package:api_tutor_1/last_example.dart';
import 'package:api_tutor_1/signin.dart';
import 'package:api_tutor_1/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'example_two.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Api Course 1",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('API Course'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(
                  builder: (context) {
                    return const HomeScreen();
                  },
                ));
              },
              child: const Text("1st Example"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(
                  builder: (context) {
                    return const ExampleTwo();
                  },
                ));
              },
              child: const Text("2nd Example"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(
                  builder: (context) {
                    return const ExampleThree();
                  },
                ));
              },
              child: const Text("3rd Example"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(
                  builder: (context) {
                    return const ExampleFour();
                  },
                ));
              },
              child: const Text("4th Example"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(
                  builder: (context) {
                    return const LastExample();
                  },
                ));
              },
              child: const Text("Last Example"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(
                  builder: (context) {
                    return const SignUp();
                  },
                ));
              },
              child: const Text("Sign Up"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(
                  builder: (context) {
                    return const SignIn();
                  },
                ));
              },
              child: const Text("Sign In"),
            ),
          ],
        ),
      ),
    );
  }
}
