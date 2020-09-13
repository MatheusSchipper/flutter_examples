import 'package:examples/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meta/meta.dart';
import 'package:share/share.dart';
import 'package:transparent_image/transparent_image.dart';

class GifTableWidget extends StatelessWidget {
  final BuildContext context;
  final AsyncSnapshot snapshot;
  final String search;
  final Function() onTapLoadMore;

  const GifTableWidget({
    Key key,
    @required this.context,
    @required this.snapshot,
    @required this.search,
    @required this.onTapLoadMore,
  }) : super(key: key);

  int _getCount() {
    var length = snapshot.data['data'].length;
    return search == null || search.isEmpty ? length : length + 1;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: _getCount(),
      itemBuilder: (context, index) {
        if (search == null || index < snapshot.data['data'].length)
          return GestureDetector(
            child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: snapshot.data['data'][index]['images']['fixed_height']
                    ['url']),
            onTap: () {
              Modular.to.pushNamed(gifDetailRoute,
                  arguments: snapshot.data['data'][index]);
            },
            onLongPress: () {
              Share.share(snapshot.data['data'][index]['images']['fixed_height']
                  ['url']);
            },
          );
        else {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
            ),
            child: GestureDetector(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 48,
                  ),
                  Text(
                    'Carregar mais...',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              onTap: onTapLoadMore,
            ),
          );
        }
      },
    );
  }
}
