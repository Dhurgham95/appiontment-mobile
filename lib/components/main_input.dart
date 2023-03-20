import 'package:flutter/material.dart';

class MainInput extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final Icon? icon;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final bool enableSuggestions;
  final bool autocorrect;
  final int linesNo;
  final int minlinesNo;
  const MainInput({
    Key? key,
    required this.hintText,
    this.icon,
    this.controller,
    this.validator,
    this.autocorrect = false,
    this.enableSuggestions = false,
    this.obscureText = false,
    this.linesNo = 2,
    this.minlinesNo = 1,
  }) : super(key: key);

  @override
  State<MainInput> createState() => _MainInputState();
}

class _MainInputState extends State<MainInput> {
  var border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(50),
    borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3f000000),
            blurRadius: 4,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          obscureText: widget.obscureText,
          enableSuggestions: widget.enableSuggestions,
          autocorrect: widget.autocorrect,
          keyboardType: TextInputType.multiline,
          maxLines: widget.linesNo,
          minLines: widget.minlinesNo,
          decoration: InputDecoration(
            hintText: widget.hintText,
            fillColor: Colors.white,
            filled: true,
            contentPadding: const EdgeInsets.all(25),
            border: border,
            focusedBorder: border,
            enabledBorder: border,
            errorBorder: border,
            disabledBorder: border,

            prefixIcon: (widget.icon != null)
                ? Padding(
                    padding: const EdgeInsets.only(left: 15, right: 10),
                    child: widget.icon)
                : null,
            // prefixIcon: (widget.icon != null)?Padding(
            //     padding: const EdgeInsets.only(left: 15, right: 10),
            //     child: widget.icon):null,
          ),
        ),
      ),
    );
  }
}
