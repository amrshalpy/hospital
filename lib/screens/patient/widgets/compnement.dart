import 'package:flutter/material.dart';
import 'package:hms/constants/constants.dart';

Widget buildFormField({
  TextEditingController? controller,
  String? hint,
  String? label,
  IconData? icon,
  TextInputType? type,
}) {
  return TextField(
    controller: controller,
    keyboardType: type,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      hintText: hint,
      labelText: label,
      prefixIcon: Icon(icon),
    ),
  );
}

nextPage(context, Widget page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

buildCheckBox({
  bool? value,
  Function? check,
}) {
  return Checkbox(
    value: value,
    activeColor: kMainColor,
    onChanged: (val) {
      check!();
    },
  );
}
