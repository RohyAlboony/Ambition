import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/shared/components/components.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isShowPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Text(
                    "تسجيل الدخول",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(203, 50, 203, 1)
                    ),
                  ),
                  SizedBox(height: 20,),
                  Column(
                    children: [
                      defaultTextbox(
                        controller: phoneNumberController,
                        labelText: "رقم الجوال",
                        prefixIcon: Icons.phone,
                        keyboardType: TextInputType.phone,
                        validate: (String value){
                          if(value.isEmpty){
                            return "يرجى إدخال رقم الجوال";
                          }
                          return null;
                        }
                      ),
                      SizedBox(height: 10,),
                      defaultTextbox(
                        controller: passwordController,
                        labelText: "كلمة المرور",
                        prefixIcon: Icons.lock,
                        suffixIcon: isShowPassword ? Icons.visibility : Icons.visibility_off,
                        obscureText: isShowPassword,
                        keyboardType : TextInputType.visiblePassword,
                        validate: (String value){
                          if(value.isEmpty){
                            return "يرجى إدخال كلمة المرور";
                          }
                          return null;
                        },
                        suffixIconPressed: (){
                          setState(() {
                            isShowPassword = !isShowPassword;
                          });
                        }
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: double.infinity,
                    child: Text(
                      "هل نسيت كلمة المرور ؟",
                      style: TextStyle(
                        color: Color.fromRGBO(203, 50, 203, 0.6),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(
                        child: defaultButtonWithIcon(
                          text: "تسجيل الدخول",
                          icon: Icons.vpn_key,
                          onPressed: (){
                            if(formKey.currentState.validate()){
                              print("success");
                            }
                          }
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: defaultButtonWithIcon(
                          text: "دخول كزائر",
                          icon: Icons.login,
                          reverseColors : true,
                          onPressed: (){
                            if(formKey.currentState.validate()){
                              print("success");
                            }
                          }
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SizedBox(height: 20,)
                  ),
                  Container(
                    width: double.infinity,
                    child: Text(
                      "لا تمتلك حساب ؟ , إضغط على زر إنشاء حساب و انضم إلينا الآن",
                      style: TextStyle(
                        color: Color.fromRGBO(203, 50, 203, 0.6),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  defaultButtonWithIcon(
                    text: "إنشاء حساب جديد",
                    icon: Icons.supervised_user_circle_rounded,
                    reverseColors : true,
                    onPressed: (){
                      if(formKey.currentState.validate()){
                        print("success");
                      }
                    }
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}