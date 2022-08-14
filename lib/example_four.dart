import 'dart:convert';

import 'package:api_tutor_1/example_three.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleFour extends StatefulWidget {
  const ExampleFour({Key? key}) : super(key: key);

  @override
  State<ExampleFour> createState() => _ExampleFourState();
}

class _ExampleFourState extends State<ExampleFour> {
  var data;
  Future<void> getUserApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("4th"),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: getUserApi(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                      backgroundColor: Colors.grey.shade200),
                );
              } else {
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ReuseableRow(
                                title: "Name",
                                value: data[index]['name'].toString()),
                            ReuseableRow(
                                title: "Username",
                                value: data[index]['username'].toString()),
                            ReuseableRow(
                                title: "Email",
                                value: data[index]['email'].toString()),
                            ReuseableRow(
                                title: "City",
                                value:
                                    data[index]['address']['city'].toString()),
                            ReuseableRow(
                                title: "Street",
                                value: data[index]['address']['street']
                                    .toString()),
                            ReuseableRow(
                                title: "Lat",
                                value: data[index]['address']['geo']['lat']
                                    .toString()),
                            ReuseableRow(
                                title: "Lng",
                                value: data[index]['address']['geo']['lng']
                                    .toString()),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ))
        ],
      ),
    );
  }
}
