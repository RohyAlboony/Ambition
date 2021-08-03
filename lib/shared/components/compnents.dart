import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class EditTextUtils {
  TextFormField getCustomEditTextArea({String hintValue = ""}) {
    TextFormField textFormField = TextFormField(
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        fillColor: Colors.white,
        hoverColor: Colors.white,
        hintStyle: TextStyle(color: Colors.white),
        hintText: hintValue,
      ),
      style:
          TextStyle(fontSize: 14.0, color: Colors.white, fontFamily: "Roboto"),
      cursorColor: Colors.white,
    );
    return textFormField;
  }
}

class myFloatingBTN extends StatelessWidget {
  myFloatingBTN({Key key, this.onTap, @required this.toolTip})
      : super(key: key);
  final Function onTap;
  String toolTip;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        ),
        FloatingActionButton(
          tooltip: toolTip,
          child: Container(
            width: 60,
            height: 60,
            child: Icon(
              Icons.add,
              size: 40,
            ),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Color.fromRGBO(133, 88, 58, 1),
                      Color.fromRGBO(0, 220, 255, 1),
                    ])),
          ),
          onPressed: () {
            onTap();
            //  _navigateToNextScreen(context, MyRegister());
          },
        ),
      ],
    );
  }
}

Widget userIcon() => Icon(
  Icons.account_circle,
  size: 80,
  color: Colors.white,
);