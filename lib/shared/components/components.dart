
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultButton({
  @required String text,
  @required Function onPressed,
  double width = double.infinity,
  bool reverseColors = false,
  IconData icon,
}) => 
Container(
  width: width,
  height: 45,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(5),
  ),
  child: MaterialButton(
    onPressed: onPressed,
    color: Colors.blue,
    child: Text(
      text,
      style: TextStyle(
        color: Colors.white
      ),
    ),
  ),
);

Widget defaultButtonWithIcon({
  @required String text,
  @required Function onPressed,
  double width = double.infinity,
  bool reverseColors = false,
  IconData icon,
}) => 
Container(
  width: width,
  height: 45,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: reverseColors ? Colors.transparent : Color.fromRGBO(203, 50, 203, 1),
    border: Border.all(
      width: 1,
      color: Color.fromRGBO(203, 50, 203, 1)
    )
  ),
  child: MaterialButton(
    onPressed: onPressed,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
            color: reverseColors ? Color.fromRGBO(203, 50, 203, 1) : Colors.white
          ),
        ),
        SizedBox(width: icon != null ? 5 : 0,),
        Icon(
          icon != null ? icon : null,
          color: reverseColors ? Color.fromRGBO(203, 50, 203, 1) : Colors.white,
        ),
      ],
    ),
  ),
);

Widget defaultTextbox({
  @required TextEditingController controller,
  @required IconData prefixIcon,
  @required String labelText,
  @required Function validate,
  IconData suffixIcon,
  Function suffixIconPressed,
  Function onSubmit,
  Function onChanged,
  Function onTap,
  TextInputType keyboardType = TextInputType.text,
  bool obscureText = false,
  bool isClickable = true,
}) => 
TextFormField(
  controller: controller,
  keyboardType: keyboardType,
  onFieldSubmitted: onSubmit,
  onChanged: onChanged,
  validator: validate,
  obscureText: obscureText,
  onTap: onTap,
  enabled: isClickable,
  decoration: InputDecoration(
    labelText: labelText,
    border: OutlineInputBorder(),
    prefixIcon: Icon(prefixIcon),
    suffixIcon: suffixIcon != null ? 
      IconButton(
        onPressed: suffixIconPressed,
        icon : Icon(suffixIcon)
      )
      : null,
  ),
);