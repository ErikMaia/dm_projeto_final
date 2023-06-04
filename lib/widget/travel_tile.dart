// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TravelTile extends StatelessWidget {
  String title;
  String description;
  String imageUrl;
  TravelTile({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 200,
          child: Image.network(imageUrl, fit: BoxFit.fill),
        ),
        SizedBox(
          width: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(title),
              Text(description),
            ],
          ),
        )
      ],
    );
  }
}
