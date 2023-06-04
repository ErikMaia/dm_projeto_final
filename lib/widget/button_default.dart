// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ButtonDefault extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  const ButtonDefault({
    Key? key,
    required this.text,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: onPress,
        child: Text(text),
      ),
    );
  }
}
