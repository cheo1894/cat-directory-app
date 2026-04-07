import 'package:flutter/material.dart';

class AppTextFieldProps {
  final String hintText;
  final Color? hintColor;
  final IconData? suffixIcon;
  final TextEditingController? controller;

  AppTextFieldProps({required this.hintText, this.suffixIcon, this.controller, this.hintColor});
}

class AppTextField extends StatelessWidget {
  final AppTextFieldProps props;
  const AppTextField({Key? key, required this.props}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: props.controller,

      decoration: InputDecoration(
        hintText: props.hintText,
        hintStyle: TextStyle(color: props.hintColor ?? Colors.white),
        filled: true,
        fillColor: Colors.black.withAlpha(40),
        suffixIcon: props.suffixIcon != null ? Icon(props.suffixIcon, color: Colors.white) : null,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.transparent, width: 0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.transparent, width: 0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.transparent, width: 0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.transparent, width: 0),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.transparent, width: 0),
        ),
      ),
    );
  }
}
