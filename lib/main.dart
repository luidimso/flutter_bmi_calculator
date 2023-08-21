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

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String infoText = "Insert your data!";

  void resetFields() {
    setState(() {
      weightController.text = "";
      heightController.text = "";
      infoText = "Insert your data!";
    });
  }

  void calculate() {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text) / 100;
    double bmi = weight / (height * height);

    setState(() {
      if(bmi <= 18.5) {
        infoText = "Underweight (${bmi})";
      } else if(bmi > 18.5 && bmi <= 25) {
        infoText = "Normal range (${bmi})";
      } else if(bmi > 25 && bmi <= 30) {
        infoText = "Overweight (${bmi})";
      } else {
        infoText = "Obesity (${bmi})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
           IconButton(
              onPressed: resetFields,
              icon: const Icon(Icons.refresh)
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.person_outline,
              size: 120.0,
              color: Colors.green,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Weight",
                labelStyle: TextStyle(
                  color: Colors.green
                ),
              ),
              controller: weightController,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.green,
                fontSize: 25.0
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: "Height",
                  labelStyle: TextStyle(
                      color: Colors.green
                  )
              ),
              controller: heightController,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.green,
                  fontSize: 25.0
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                bottom: 10.0
              ),
              child: Container(
                height: 50.0,
                child: ElevatedButton(
                  onPressed: calculate,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.green)
                  ),
                  child: const Text("Calculate",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0
                    ),
                  ),
                ),
              ),
            ),
            Text(infoText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.green,
                fontSize: 25.0
              ),
            )
          ],
        ),
      ),
    );
  }
}
