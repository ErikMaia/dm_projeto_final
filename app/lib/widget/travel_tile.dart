// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class TravelTile extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  VoidCallback onPressed;
  TravelTile({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.onPressed,
  }) : super(key: key);
  
  Future<void> navigate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('title', title);
    prefs.setString('description', description);
    prefs.setString('imageUrl', imageUrl);
    // ignore: use_build_context_synchronously
    onPressed();    
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: navigate,
      child: Row(
        children: [
          SizedBox(
            width: 200,
            child: Image.network(imageUrl, fit: BoxFit.fill),
          ),
          SizedBox(
            width: 140,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(title),
                Text(description),
              ],
            ),
          )
        ],
      ),
    );
  }
}
