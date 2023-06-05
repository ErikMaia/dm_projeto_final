// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:projeto_final/pages/reservation_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class TravelTile extends StatelessWidget {
  String title;
  String description;
  String imageUrl;
  late BuildContext context;
  TravelTile({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
  }) : super(key: key);

  Future<void> navigate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('title', title);
    prefs.setString('description', description);
    prefs.setString('imageUrl', imageUrl);
    // ignore: use_build_context_synchronously
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const ReservationDetails()),
    );
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
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
