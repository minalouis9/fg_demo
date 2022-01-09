import 'package:flutter/material.dart';

class CTextFiledForm extends TextFormField {
  final TextEditingController fieldController;
  final String? label, hint;
  final int? maxLines;
  final bool readOnly;
  final Widget? suffixIcon;
  final bool isEnabled;

  CTextFiledForm({Key? key, required this.fieldController, this.label, this.hint, this.maxLines, this.readOnly = false, this.isEnabled = true, this.suffixIcon})
      : super(
          key: key,
          enabled: isEnabled,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value){
            if(value == null || value.isEmpty) {
              return "Can't be empty";
            }
            return null;
          },
          controller: fieldController,
          maxLines: maxLines,
          readOnly: readOnly,
          decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            suffixIcon: suffixIcon
          ),
        );
}
