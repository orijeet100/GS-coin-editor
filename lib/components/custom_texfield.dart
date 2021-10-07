import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({required this.controller,required this.weightChangeFunction});
  final TextEditingController controller;
  final Function weightChangeFunction;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
        child: TextFormField(
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly
          ],
          onChanged: (value)
          {
            widget.weightChangeFunction(value);
          },
          controller: widget.controller,
          obscureText: false,
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFD7C1C1),
                width: 1,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4.0),
                topRight: Radius.circular(4.0),
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFD7C1C1),
                width: 1,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4.0),
                topRight: Radius.circular(4.0),
              ),
            ),
            suffixIcon: InkWell(
              onTap: () => setState(
                    () => widget.controller.clear(),
              ),
              child: Icon(
                Icons.clear,
                color: Color(0xFF757575),
                size: 22,
              ),
            ),
          ),
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 20,
          ),
          keyboardType: TextInputType.number,
        ),
      ),
    );
  }
}
