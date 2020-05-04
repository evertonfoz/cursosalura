import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final IconData prefixIcon;
  final String hintText;

  const TextFieldWidget({this.prefixIcon, this.hintText});

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Stack(
        children: [
          Icon(widget.prefixIcon),
          TextField(
            decoration: InputDecoration(
              hintText: widget.hintText,
              contentPadding: const EdgeInsets.only(
                left: 30.0,
                right: 0,
                top: 11,
                bottom: 11,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
