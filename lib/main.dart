import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => __MyHomePageState();
}

class __MyHomePageState extends State<MyHomePage> {
  String output = '0';

  String temp =
      '0'; 
  double num1 = 0;
  double num2 = 0;
  String operand = "";
  String history = "";

  Widget buildbutton(String buttonValue, int flexValue) {
    return Expanded(
      flex: flexValue,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
          ),
          onPressed: () {
            
            setState(() {
              if (buttonValue == 'AC') {
                temp = '0';
                num1 = 0;
                num2 = 0;
                operand = "";
              } 
             
              else if (buttonValue == '+' ||
                  buttonValue == '-' ||
                  buttonValue == 'x' ||
                  buttonValue == '/' ||
                  buttonValue == '%') {
                num1 = double.parse(output);
                operand = buttonValue;
                temp = '0';
              } 
              else if (buttonValue == '.') {
                if (temp.contains('.')) {
                  print(
                      "already contains a decimal");
                  return;
                } else {
                  temp = temp +
                      buttonValue; 
                }
              } else if (buttonValue == "=") {
                num2 = double.parse(output);
                //add
                if (operand == '+') {
                  temp = (num1 + num2).toString();
                } 
                //subtract
                else if (operand == '-') {
                  temp = (num1 - num2).toString();
                } 
                //multiply
                else if (operand == 'x') {
                  temp = (num1 * num2).toString();
                }
                //divide
                 else if (operand == '/') {
                  temp = (num1 / num2).toString();
                } 
                //perecent
                else if (operand == '%') {
                  temp = (num1 % num2).toString();
                }

                num1 = 0;
                num2 = 0;
                operand = "";
              } else {
                temp = temp + buttonValue;
              }

              setState(() {
                output = double.parse(temp).toStringAsFixed(
                    2); 
              });

              //clear
             if(buttonValue!= 'AC'){
              history = history + buttonValue;  
              }
              else{
                history = '';                 
              }
              
            });
          },


        //button
          child: Container(
            child: Text(
              buttonValue,
              style: TextStyle(
                  fontSize: 30, color: Colors.white),
            ),
            padding: EdgeInsets.all(15),
          ),
        ),
      ),
      
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 201, 199, 199),

      body: Container(
          child: Column(
        children: [
          Expanded(
            child: new Divider(),
          ),
         
         Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 12.5),
            child: new Text(
              history,
              style: TextStyle(
                fontSize: 30,
                 fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
         
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(12.5, 12.5, 12.5, 25),
            child: new Text(
              output,
              style: TextStyle(
                fontSize: 85,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),


          Column(
            children: [
              Row(
                children: [
                  buildbutton("AC", 2),
                  buildbutton("%", 1),
                  buildbutton("/", 1),
                ],
              ),
              Row(
                children: [
                  buildbutton("7", 1),
                  buildbutton("8", 1),
                  buildbutton("9", 1),
                  buildbutton("x", 1),
                ],
              ),
              Row(
                children: [
                  buildbutton("4", 1),
                  buildbutton("5", 1),
                  buildbutton("6", 1),
                  buildbutton("-", 1),
                ],
              ),
              Row(
                children: [
                  buildbutton("1", 1),
                  buildbutton("2", 1),
                  buildbutton("3", 1),
                  buildbutton("+", 1),
                ],
              ),
              Row(
                children: [
                  buildbutton("0", 1),
                  buildbutton(".", 1),
                  buildbutton("=", 2),
                ],
              ),
            ],
          ),
        ],
      )),
    );
  }
}