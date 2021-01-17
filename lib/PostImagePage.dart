import 'package:flutter/material.dart';
import 'package:flutter_instagram_downloader/flutter_instagram_downloader.dart';
class PostImagePage extends StatefulWidget {
  @override
  _PostImagePageState createState() => _PostImagePageState();
}

class _PostImagePageState extends State<PostImagePage> {
  TextEditingController linkController = TextEditingController();
  var username,profilePicUrl,displayUrl,videoUrl,text,artistName;
  FlutterInsta flutterInsta=new FlutterInsta();


  Widget getTextField()
  {
    return   Container(
      padding: EdgeInsets.fromLTRB(20,10,20,10),
      child: TextField(
        onEditingComplete: () {
          getFeedImages();
        },
        controller: linkController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Enter URL',
          hintStyle: TextStyle(fontSize: 16),
          suffixIcon: IconButton(
            onPressed: () => linkController.clear(),
            icon: Icon(Icons.clear),
          ),
          enabledBorder: const OutlineInputBorder(
            // width: 0.0 produces a thin "hairline" border
            borderSide:
            const BorderSide(color: Colors.green, width: 2.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              width: 2,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          contentPadding: EdgeInsets.all(16),
          fillColor: Color(0xFFF2F2F2),

        ),
      ),
    );
  }
  Widget _buttons()
  {
    return  GestureDetector(
      onTap: () async {
        getFeedImages();

      },
      child: Container(
        width: MediaQuery.of(context).size.width /1.5,
        padding: EdgeInsets.symmetric(vertical: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            color: Colors.pinkAccent),
        child: Text(
          'Submit',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(),
        child: Column(

          children: [
            getTextField(),
            _buttons(),
            flutterInsta.videourl!= null
                ? getThumbnailView()
                : Container(),
            SizedBox(height: 5,),
          ],
        ),
      ),
    );
  }
  getFeedImages() async
  {
    await flutterInsta.downloadReelsVideos(linkController.text);
    setState(() {
      username=flutterInsta.username;
      profilePicUrl=flutterInsta.profilepicurl;
      displayUrl=flutterInsta.imgurl;
      videoUrl=flutterInsta.videourl;
      artistName=flutterInsta.username;
      username=flutterInsta.username;
    });

  }
  Widget getThumbnailView()
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(
              10.0, 10.0, 10.0, 6.0),
          child: Row(
            children: <Widget>[
              Container(
                height: 40.0,
                width: 40.0,
                decoration: new BoxDecoration(
                  border: Border.all(
                      color: Colors.pink, width: 1.5),
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new NetworkImage(profilePicUrl)),
                ),
              ),
              new SizedBox(
                width: 10.0,
              ),
              new Text(
                username,
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        new Image.network(displayUrl,
          fit: BoxFit.cover,
          height: 350,
          width: double.infinity,
        )

      ],
    );
  }
}
