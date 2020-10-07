import 'package:flutter/material.dart';

class DefaultButtons {
  static Widget floatButton(BuildContext context,
      {@required String title,
      @required double width,
      @required double height,
      bool isFloating = true,
      Color color = Colors.white,
      Color textColor = Colors.black,
      Widget leading,
      Function onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: color,
            boxShadow: isFloating
                ? [
                    BoxShadow(
                        color: Colors.black45,
                        offset: Offset(0, 5),
                        blurRadius: 5)
                  ]
                : null),
        padding: EdgeInsets.symmetric(horizontal: width, vertical: height),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leading != null) leading,
            if (leading != null) SizedBox(width: 15),
            Text(
              title,
              style: TextStyle(
                  fontSize: 20, color: textColor, fontWeight: FontWeight.bold),
            ),
            if (leading != null) SizedBox(width: 35),
          ],
        ),
      ),
    );
  }
}
