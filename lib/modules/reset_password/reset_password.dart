import 'package:ambition/modules/login/login.dart';
import 'package:ambition/modules/register/register.dart';
import 'package:ambition/shared/components/circular_background_painter.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ambition/shared/components/compnents.dart';
import 'dart:ui';

class MyResetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor:
            Colors.transparent //or set color with: Color(0xFF0000FF)
        ));

    return MaterialApp(
      title: 'Adidas Original',
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(primaryColor: Colors.white, backgroundColor: Colors.white),
      home: MyResetPasswordpage(title: 'Adidas'),
    );
  }
}

class MyResetPasswordpage extends StatefulWidget {
  MyResetPasswordpage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyResetPasswordpageState createState() => _MyResetPasswordpageState();
}

class _MyResetPasswordpageState extends State<MyResetPasswordpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
          _circularBackground(),
          Container(
            color: Colors.transparent,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            // Row is a horizontal, linear layout.
            child: ListView(children: <Widget>[
              Stack(children: <Widget>[
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0.0, vertical: 70.0),
                        child: Container(
                          width: 100,
                          height: 100,
                          child: userIcon(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: EditTextUtils()
                            .getCustomEditTextArea(hintValue: "Email:"),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 20.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 0.0),
                        child: new RaisedButton(
                          child: Container(
                            width: double.infinity,
                            child: new Text(
                              "Reset password",
                              textAlign: TextAlign.center,
                              style: new TextStyle(
                                  fontSize: 16.0,
                                  color: Color.fromRGBO(138, 138, 138, 1),
                                  fontFamily: "Roboto"),
                            ),
                          ),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                          splashColor: Color.fromRGBO(0, 220, 255, 1),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0.0, vertical: 0),
                        child: new FlatButton(
                          child: Container(
                            child: new Text(
                              "back to login ?",
                              textAlign: TextAlign.center,
                              style: new TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                  fontFamily: "Roboto"),
                            ),
                          ),
                          color: Colors.black.withOpacity(0.00),
                          onPressed: () {
                            _navigateToNextScreen(context, Mylogin());
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ]),
          )
        ]),
        floatingActionButton: new Row(children: <Widget>[
          new Padding(
            padding: new EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          ),
          FloatingActionButton(
            tooltip: "Register",
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
              _navigateToNextScreen(context, MyRegister());
            },
          ),
        ]));
  }

  void _navigateToNextScreen(BuildContext context, Object classname) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => classname));
  }

  Widget _circularBackground() {
    return new Container(
      height: window.physicalSize.height,
      width: double.infinity,
      child: new CustomPaint(
        painter:
            new CircularBackgroundPainter(MediaQuery.of(context).size.height),
      ),
    );
  }
}
