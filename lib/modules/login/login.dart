import 'package:ambition/shared/components/circular_background_painter.dart';
import 'package:flutter/rendering.dart';
import 'package:ambition/shared/components/compnents.dart';
import 'package:ambition/modules/reset_password/reset_password.dart';
import 'package:ambition/modules/register/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';

class Mylogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor:
            Colors.transparent //or set color with: Color(0xFF0000FF)
        ));

    return MaterialApp(
      title: 'Adidas Originalsss',
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(primaryColor: Colors.white, backgroundColor: Colors.white),
      home: MyLoginPage(title: 'Adidas'),
    );
  }
}

class MyLoginPage extends StatefulWidget {
  MyLoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
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
                        child: userIcon()
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 0.0),
                      child: EditTextUtils()
                          .getCustomEditTextArea(hintValue: "Username:"),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: EditTextUtils()
                          .getCustomEditTextArea(hintValue: "Password:"),
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
                            "Login",
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
                            "forget password ?",
                            textAlign: TextAlign.center,
                            style: new TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                                fontFamily: "Roboto"),
                          ),
                        ),
                        color: Colors.black.withOpacity(0.00),
                        onPressed: () {
                          //_navigateToNextScreen(context, CoursesHome());
                          _navigateToNextScreen(context, MyResetPassword());
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
      floatingActionButton: myFloatingBTN(
        toolTip: "Add",
        onTap: () => _navigateToNextScreen(context, MyRegister()),
      ),
    );
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
