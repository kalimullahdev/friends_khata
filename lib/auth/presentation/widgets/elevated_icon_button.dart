import 'package:flutter/material.dart';

class ElevatedIconButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final Icon icon;
  final bool makeWhite;
  const ElevatedIconButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.icon,
    this.makeWhite = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: makeWhite == true
          ? ElevatedButton.styleFrom(
              primary: Colors.white, onPrimary: Colors.black)
          : null,
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(width: 15),
          Text(text),
        ],
      ),
    );
  }
}
