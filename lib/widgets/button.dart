import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final Function() action;
  const Button({
    Key? key,
    required this.title,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: InkWell(
          onTap: () {
            action();
          },
          child: Container(
            color: Colors.black,
            width: 200,
            height: 50,
            child: Center(
                child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Pretendard',
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                letterSpacing: -0.16,
              ),
            )),
          ),
        ),
      ),
    );
  }
}
