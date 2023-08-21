import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: const [
           IconButton(
              onPressed: null,
              icon: Icon(Icons.refresh)
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(Icons.person_outline,
            size: 120.0,
            color: Colors.green,
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Weight",
              labelStyle: TextStyle(
                color: Colors.green
              )
            ),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.green,
              fontSize: 25.0
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: "Height",
                labelStyle: TextStyle(
                    color: Colors.green
                )
            ),
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.green,
                fontSize: 25.0
            ),
          )
        ],
      ),
    );
  }
}
