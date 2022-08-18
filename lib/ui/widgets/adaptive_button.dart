import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final String text;
  final void Function() handler;

  const AdaptiveFlatButton({
    Key? key,
    required this.text,
    required this.handler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: handler,
            child: Text(text),
          )
        : TextButton(
            onPressed: handler,
            child: Text(text),
          );
  }
}

void getShowDatePicker(BuildContext context, Function(DateTime) onDateChosen) {
  showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2019),
          lastDate: DateTime.now())
      .then((pickedDate) {
    if (pickedDate == null) {
      return;
    }
    onDateChosen(pickedDate);
  });
}
