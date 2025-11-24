import 'package:flutter/material.dart';
class Operation extends StatefulWidget {
  const Operation({super.key});

  @override
  State<Operation> createState() => _OperationState();
}

class _OperationState extends State<Operation> {

  final TextEditingController num1 = TextEditingController();
  final TextEditingController num2 = TextEditingController();

  String result = "";

  void calculate(String operation) {
    final double? n1 = double.tryParse(num1.text);
    final double? n2 = double.tryParse(num2.text);

    if (n1 == null || n2 == null) {
      setState(() {
        result = "Invalid input";
      });
      return;
    }

    double res = 0;

    switch (operation) {
      case '+':
        res = n1 + n2;
        break;
      case '-':
        res = n1 - n2;
        break;
      case '*':
        res = n1 * n2;
        break;
      case '/':
        if (n2 == 0) {
          result = "Cannot divide by zero";
          setState(() {});
          return;
        }
        res = n1 / n2;
        break;
    }

    setState(() {
      result = res.toString();
    });}



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextField(
            controller: num1,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "First number",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 15),
          TextField(
            controller: num2,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Second number",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),

          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(onPressed: () => calculate('+'), child: Text("+")),
              ElevatedButton(onPressed: () => calculate('-'), child: Text("-")),
              ElevatedButton(onPressed: () => calculate('*'), child: Text("*")),
              ElevatedButton(onPressed: () => calculate('/'), child: Text("/")),
            ],
          ),

          SizedBox(height: 30),
          Text(
            "Result: $result",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
