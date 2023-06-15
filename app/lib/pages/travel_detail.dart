import 'package:flutter/material.dart';
import 'package:projeto_final/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class TravelDetail extends StatefulWidget {
  const TravelDetail({super.key});

  @override
  State<TravelDetail> createState() => _TravelDetailState();
}

class _TravelDetailState extends State<TravelDetail> {
  Future<void> getContent() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      // prefs.setString('title', title);
      // prefs.setString('description', description);
      // prefs.setString('imageUrl', imageUrl);
      _title = prefs.getString('title');
      _description = prefs.getString('description');
      _image = prefs.getString('imageUrl');
      _start = DateTime.parse(prefs.getString('start')!);
      _user = prefs.getString('user');
    });
  }

  @override
  void initState() {
    super.initState();
    _description = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
    _title = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaa';
    _image =
        'https://www.vuescript.com/wp-content/uploads/2018/11/Show-Loader-During-Image-Loading-vue-load-image.png';
    _start = DateTime.now();
    getContent();
  }

  String? _title;
  String? _description;
  String? _image;
  DateTime _start = DateTime.now();
  String? _user;
  BuildContext? _context;
  void _enviar() {
    var navigator = Navigator.of(_context!);
    if (_user == null) {
      navigator.popAndPushNamed('login');
    }
    http.post(Uri.parse(Constants.travelUrl));
    navigator.popAndPushNamed('reservation');
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text(_title!),
      ),
      body: Column(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * .4,
              width: MediaQuery.of(context).size.width,
              child: ListView(children: [Text(_description!)])),
          Image.network(_image!),
          Text(_start.toString()),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: _enviar,
              child: const Text('Reservar'),
            ),
          )
        ],
      ),
    );
  }
}
