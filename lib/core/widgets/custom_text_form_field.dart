// Flutter imports:
import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key, required this.hintText, this.suffixIcon,  this.textInputType, this.onSaved ,this.obscureText = false,this.lines =1} );
  final String hintText;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final void Function(String?)? onSaved;
  final bool obscureText;
  int lines;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: lines,
      minLines: lines,
      obscureText: obscureText,
      keyboardType: textInputType,
      onSaved: onSaved ,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
      decoration: InputDecoration(

        hintText: hintText,hintStyle: TextStyle(color: Colors.white),
        suffixIcon: suffixIcon,
        border: buildBorder(),
        focusedBorder: buildBorder(),
        enabledBorder: buildBorder(),

      ),
    );
  }

  UnderlineInputBorder buildBorder() {
    return UnderlineInputBorder(

        borderSide: BorderSide(

          width: 1,
          color:Colors.grey,
        ));
  }
}
