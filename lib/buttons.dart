import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final color;
  final textColor;
  final onPressed;
  final String buttonText;

  MyButton({this.color, this.textColor, this.buttonText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Container(
             
              decoration: BoxDecoration(
              color: color,
              boxShadow: [
                BoxShadow(
                  offset: Offset(15,5),
                  blurRadius: 30,
                  spreadRadius: 5,
                  color: Colors.white,
                ),
              ]

              ),
              child: Center(
                child: Text(buttonText,
                    style: GoogleFonts.robotoMono(
                      textStyle: TextStyle(
                        color: textColor,
                        fontSize: 20,
                      ),
                    )),
              ),
            ),
          )),
    );
  }
}
