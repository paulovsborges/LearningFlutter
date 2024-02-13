import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget(
      {super.key,
      required this.callback,
      required this.label,
      required this.isEnabled});

  final VoidCallback callback;
  final Widget label;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled ? null : callback,
      child: label,
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.pressed)) return Colors.white38;
            return Colors.green;
          }),
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.disabled)) return Colors.brown;
            if (states.contains(MaterialState.pressed)) return Colors.black12;
            return Colors.red;
          }),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            side: const BorderSide(
              color: Colors.lightBlueAccent,
              width: 5,
            ),
            borderRadius: BorderRadius.circular(10),
          )),
          textStyle: MaterialStateProperty.all(
            const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          )),
    );
  }
}
