import 'package:flutter/material.dart';
import 'package:share/share.dart';

class GifDetailPage extends StatelessWidget {
  final Map gifData;

  const GifDetailPage({
    Key key,
    @required this.gifData,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var titleGif = gifData['title'];
    var urlGif = gifData['images']['fixed_height']['url'];
    return Scaffold(
      appBar: AppBar(
        title: Text(titleGif),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              Share.share(urlGif);
            },
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Image.network(urlGif),
      ),
    );
  }
}
