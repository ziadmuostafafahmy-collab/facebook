import 'package:facebook/screen_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final bool isPassword;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  State<CustomTextField> createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  late bool obscure;

  @override
  void initState() {
    super.initState();
    obscure = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: obscure,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      decoration: InputDecoration(
        hintText: widget.hint,
        filled: true,
        fillColor: Color(0xffeaeaea),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
          icon: Icon(
            obscure ? Icons.visibility_off : Icons.visibility,
            color: ScreenColors.grayColor,
          ),
          onPressed: () {
            setState(() {
              obscure = !obscure;
            });
          },
        )
            : null,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}