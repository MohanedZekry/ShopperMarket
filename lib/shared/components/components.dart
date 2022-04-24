import 'package:flutter/material.dart';
import 'package:shop_app/shared/styles/colors.dart';

Widget mButton({
  required VoidCallback onPressed,
  required String text,
  Color txtColor = Colors.white,
  Color backgroundColor = primaryColorRGB,
  double width = double.infinity,
  double height = 50.0,
  double txtSize = 18.0,
  FontWeight fontWeight = FontWeight.bold,
  bool isUpperCase = true,
  double radius = 3,
  bool removeWidth = false,
  double verticalPadding = 0,
  double horizontalPadding = 0,
}) => Container(
  padding: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: horizontalPadding),
  width: !removeWidth? width : null,
  height: height,
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(radius),
  ),
  child: MaterialButton(
    child: Text(
      isUpperCase? text.toUpperCase() : text,
      style: TextStyle(
        color: txtColor,
        fontSize: txtSize,
        fontWeight: fontWeight,
      ),
    ),
    onPressed: onPressed,
  ),
);

Widget mTextForm({
  required TextEditingController controller,
  required TextInputType type,
  //required String validation,
  required String label,
  bool isUpperCase = false,
  IconData? suffixIcon,
  required IconData prefixIcon,
  double radius = 3.0,
  FormFieldValidator<String>? validator,
  bool isPassword = false,
  TextInputAction actionButton= TextInputAction.next,
}) => TextFormField(
      controller: controller,
      keyboardType: type,
      validator: validator,
      textInputAction: actionButton,
      /*validator: (value) {
        if (value != null) {
          return validation;
        }
        return null;
      },*/
      obscureText: isPassword,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
        prefixIcon: Icon(
          prefixIcon,
        ),
        suffixIcon: Icon(
          /* suffixIcon OR */ isPassword? Icons.remove_red_eye : null,
        ),
      ),
    );

void hideKeyboard(BuildContext context) => FocusScope.of(context).unfocus();

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
        (Route<dynamic> route) => false);