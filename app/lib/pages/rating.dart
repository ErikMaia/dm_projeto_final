import 'package:flutter/material.dart';
import 'package:projeto_final/widget/drawer_default.dart';

class Rating extends StatefulWidget {
  const Rating({Key? key}) : super(key: key);

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  List<bool> stars = List.filled(5, false);

  void _selectStars(int position) {
    setState(() {
      for (int i = 0; i < stars.length; i++) {
        stars[i] = i < position;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Avaliar')),
      drawer: DrawerDefault(),
      body: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration:
                  const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.2)),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(MediaQuery.of(context).size.width*.205),
              
              child: Row(
                children: List.generate(
                  stars.length,
                  (index) => IconButton(
                    onPressed: () {
                      _selectStars(index + 1);
                    },
                    icon: Icon(stars[index] ? Icons.star_border : Icons.star),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
