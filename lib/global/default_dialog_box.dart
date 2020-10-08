import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class DefaultDialogBox {
  static Future<dynamic> errorDialog(BuildContext context,
      {String title = 'Failed !',
      String content = 'Something went wrong !\nPlease try again.',
      Function function}) {
    return showDialog(
      context: context,
      builder: (ctx) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            IconButton(
              icon: Icon(FlutterIcons.check_circle_faw),
              onPressed:
                  function != null ? function : () => Navigator.of(ctx).pop(),
            ),
          ],
        ),
      ),
    );
  }

  static Future<dynamic> loadingDialog(BuildContext context,
      {String title, bool blur = true, Color loaderColor = Colors.white}) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => BackdropFilter(
        filter:
            blur ? ImageFilter.blur(sigmaX: 3, sigmaY: 3) : ImageFilter.blur(),
        child: WillPopScope(
          onWillPop: () async => Future.value(false),
          child: AlertDialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Center(
                child: Column(
              children: [
                title == null
                    ? null
                    : Container(
                        margin: const EdgeInsets.only(bottom: 45),
                        alignment: Alignment.center,
                        child: Text(title,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: loaderColor))),
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(loaderColor),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
