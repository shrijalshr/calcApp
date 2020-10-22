import 'package:calcApp/buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(CalcApp());
}

class CalcApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<String> button = [
    "AC",
    "DEL",
    "%",
    "/",
    "7",
    "8",
    "9",
    "x",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    "0",
    ".",
    "Ans",
    "=",
  ];
  String pressedText = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black45,
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomRight,
                child: Text(pressedText,
                    style: GoogleFonts.robotoMono(
                        textStyle: TextStyle(
                      fontSize: 70,
                      color: Colors.white,
                    ))),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: GridView.builder(
                  itemCount: button.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0 || index == 1 || index == 2) {
                      return MyButton(
                        buttonText: button[index],
                        color: Colors.grey[200],
                        textColor: Colors.black,
                        onPressed: () {
                          setState(() {
                            if (index == 0) {
                              pressedText = '';
                            }
                            if(index==1){
                              pressedText  = pressedText.substring(0, pressedText.length -1) ;
                            }
                          });
                        },
                      );
                    }

                    return MyButton(
                      onPressed: () {
                        setState(() {
                          pressedText += button[index];
                        });
                      },
                      buttonText: button[index],
                      color: isOperator(button[index])
                          ? Colors.orangeAccent
                          : Colors.grey[800],
                      textColor: Colors.white,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isOperator(String x) {
    if (x == "/" || x == "x" || x == "-" || x == "+" || x == "=") {
      return true;
    }
    return false;
  }
}
