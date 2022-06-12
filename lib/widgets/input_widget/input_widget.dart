import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final String title;
  final String hintText;
  const InputWidget({
    Key? key,
    required this.title,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              top: 10,
              bottom: 10,
            ),
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: 'Pretendard',
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                letterSpacing: -0.16,
              ),
            ),
          )
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 30),
        child: Container(
          width: double.infinity,
          height: 51,
          decoration: BoxDecoration(
              border: Border.all(color: const Color.fromARGB(255, 240, 240, 240)),
              borderRadius: BorderRadius.circular(3)),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 20, top: 16, bottom: 16),
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: const TextStyle(
                fontFamily: 'Pretendard',
                color: Color(0x4c222222),
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                letterSpacing: -0.16,
              ),
            ),
            onChanged: (value) => {},
          ),
        ),
      ),
    ]);
  }
}
