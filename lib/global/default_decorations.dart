import 'package:flutter/material.dart';

class DefaultDecorations {
  static Decoration tcBcLgradient(BuildContext context, Color color) {
    return BoxDecoration(
      color: Colors.white,
      gradient: LinearGradient(colors: [
        color.withOpacity(0.3),
        color.withOpacity(0.4),
        color.withOpacity(0.6),
        color.withOpacity(0.8),
        color
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
    );
  }

  static InputDecoration defaultInputDecoration(
    BuildContext context, {
    @required IconData icon,
    String label,
  }) {
    return InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        labelStyle: TextStyle(fontWeight: FontWeight.bold));
  }

  static InputDecoration roundedInputDecoration(
    BuildContext context, {
    TextEditingController controller,
    @required IconData icon,
    Icon suffix,
    String title,
  }) {
    return InputDecoration(
        hintText: title,
        prefixIcon: Icon(icon),
        suffixIcon: IconButton(
            icon: suffix,
            color: controller.text.isNotEmpty ? null : Colors.grey[200],
            onPressed: () {
              controller.clear();
            }),
        contentPadding: EdgeInsets.zero,
        hintStyle: TextStyle(fontSize: 18),
        fillColor: Colors.grey[200],
        filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none));
  }
}
