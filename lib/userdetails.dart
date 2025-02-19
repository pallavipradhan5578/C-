import 'package:flutter/material.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  bottonPresses(String buttonText) {
    if (buttonText == 'C') {
      setState(() {
        _output = "0";
        output = "0";
        num1 = 0.0;
        num2 = 0.0;
        operand = "";
      });
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "*" ||
        buttonText == "/" ||
        buttonText == "") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == "=") {
      num2 = double.parse(output);
      switch (operand) {
        case "+":
          _output = "${num1 + num2}".toString();

          break;
        case "-":
          _output = "${num1 - num2}".toString();
          break;
        case "*":
          _output = "${num1 * num2}".toString();
          break;
        case "/":
          _output = "${num1 / num2}".toString();
          break;
      }
      //num1 = 0;
      //num2 = 0;
      //operand = "";
    } else {
      _output += buttonText;
      output = _output;
    }
    setState(() {
      output = double.parse(_output)
          .toStringAsFixed(2)
          .replaceAll(RegExp(r'\.00$'), '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              child: Text(
                "$num1" +  "$operand " + "$num2",
                style: const TextStyle(fontSize: 32, color: Colors.white70),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12),
                child: Text(
                  output,
                  style: TextStyle(fontSize: 48, color: Colors.white),
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            Column(
              children: [
                Row(
                  children: [
                    buildButton("7", Colors.grey.shade800),
                    buildButton("8", Colors.grey.shade800),
                    buildButton("9", Colors.grey.shade800),
                    buildButton("/", Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildButton("4", Colors.grey.shade800),
                    buildButton("5", Colors.grey.shade800),
                    buildButton("6", Colors.grey.shade800),
                    buildButton("*", Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildButton("1", Colors.grey.shade800),
                    buildButton("2", Colors.grey.shade800),
                    buildButton("3", Colors.grey.shade800),
                    buildButton("-", Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildButton(".", Colors.grey.shade800),
                    buildButton("0", Colors.grey.shade800),
                    buildButton("C", Colors.grey.shade800),
                    buildButton("+", Colors.orange),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      buildButton("=", Colors.green.shade800),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildButton(String buttonText, Color buttonColor) {
    return Expanded(
        child: Container(
      margin: const EdgeInsets.all(8),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(24),
              backgroundColor: buttonColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          onPressed: () {
            bottonPresses(buttonText);
          },
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 24, color: Colors.white),
          )),
    ));
  }
}
