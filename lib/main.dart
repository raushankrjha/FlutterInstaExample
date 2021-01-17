import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_instagram_downloader/flutter_instagram_downloader.dart';
import 'package:teast_flutterapp/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
