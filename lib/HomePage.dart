

import 'dart:io';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teast_flutterapp/PostImagePage.dart';
import 'package:teast_flutterapp/ReelsPage.dart';

class HomePage extends StatefulWidget {
  static String tag = '/HomePage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  TextEditingController usernameController = TextEditingController();

  @override
  void initState() {
    tabController = TabController(vsync: this, initialIndex: 1, length: 2);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness:
      Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      appBar: AppBar(
        title: Text("InstaSaver",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
      ),
      resizeToAvoidBottomInset : false,
      body: TabBarView(
        controller: tabController,
        children: [
          PostImagePage(), // home screen
          ReelsPage()
        ],
      ),
      bottomNavigationBar: ConvexAppBar(
        activeColor: Colors.white,
        color: Colors.white,
        top: -22,
        backgroundColor: Colors.pink,
        items: [
          TabItem(icon: Icons.image, title: 'Feed'),
          TabItem(icon: Icons.videocam, title: 'Reels'),
        ],
        controller: tabController,
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();

  }
}
