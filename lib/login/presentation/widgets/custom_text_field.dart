
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final Icon prefixIcon;
  final bool obscureText;
  final Function()? toggleVisibility;
  final Icon? suffixIcon;
  final FormFieldValidator<String>? validator;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,
    this.toggleVisibility,
    this.suffixIcon,
    this.validator,
    this.obscureText = false,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _isFocused;

  @override
  void initState() {
    super.initState();
    _isFocused = false;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        labelText: _isFocused ? null : widget.labelText,
        hintText: _isFocused ? widget.hintText : null,
        hintStyle: TextStyle(color: Colors.grey.withOpacity(0.3)), 
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.toggleVisibility != null
            ? IconButton(
                icon: widget.suffixIcon ?? Icon(Icons.visibility),
                onPressed: widget.toggleVisibility!,
              )
            : widget.suffixIcon,
        border: OutlineInputBorder(), 
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ), 
      ),
      validator: widget.validator,
      onChanged: (value) {
        setState(() {});
      },
      onTap: () {
        setState(() {
          _isFocused = true;
        });
      },
      onEditingComplete: () {
        setState(() {
          _isFocused = false;
        });
      },
      onFieldSubmitted: (value) {
        setState(() {
          _isFocused = false;
        });
      },
    );
  }
}
