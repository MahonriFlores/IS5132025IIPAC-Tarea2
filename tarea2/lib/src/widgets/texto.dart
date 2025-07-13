import 'package:flutter/material.dart';

class campoTexto extends StatelessWidget {

  const campoTexto( {super.key, 
    required this.controler,
    required this.labeltext,
    required this.hinttext,
    required this.prefixicon,
    this.suffixicon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onchanged ,
    this.color = Colors.black
  });
  final TextEditingController controler;
  final String labeltext;
  final String hinttext;
  final IconData prefixicon;
  final IconData? suffixicon;
  final TextInputType keyboardType;
  final bool obscureText;
  final Function(String)? onchanged;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextField(
            controller: controler,
            keyboardType: keyboardType,
                decoration: InputDecoration(
                  labelText: labeltext,
                  contentPadding: EdgeInsets.all(22),
                  hintText: hinttext,
                  prefixIcon: Icon(prefixicon),
                  suffixIcon: suffixicon != null ? Icon(suffixicon, color: color,) : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
            onChanged: onchanged,
    );
  }
}