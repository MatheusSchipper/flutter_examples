import 'package:dio/dio.dart';
import 'package:examples/core/utils/constants.dart';
import 'package:examples/features/gif_finder/presentation/widgets/gif_table_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class GifFinderPage extends StatefulWidget {
  @override
  _GifFinderPageState createState() => _GifFinderPageState();
}

class _GifFinderPageState extends State<GifFinderPage> {
  String _search;
  int _offset = 0;
  TextEditingController searchController = TextEditingController();
  var dio = Modular.get<Dio>();

  Future<Map> _getGifs() async {
    Response response;
    if (_search == null || _search.isEmpty) {
      response = await dio.get(trendingGifUrl);
    } else {
      response = await dio.get('$searchGifUrl&q=$_search&offset=$_offset');
    }
    return response.data;
  }

  @override
  void initState() {
    super.initState();
    _getGifs().then((map) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.network(
          'https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif',
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: "Pesquise aqui",
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: Theme.of(context)
                    .inputDecorationTheme
                    .enabledBorder
                    .copyWith(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                focusedBorder: Theme.of(context)
                    .inputDecorationTheme
                    .focusedBorder
                    .copyWith(
                      borderSide: BorderSide(color: Colors.white),
                    ),
              ),
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white),
              onSubmitted: (value) {
                _search = value;
                _offset = 0;
              },
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: _getGifs(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        strokeWidth: 5,
                      ),
                    );
                    break;
                  default:
                    if (snapshot.hasError) {
                      return Container(
                        alignment: Alignment.center,
                        child: Text("Erro ao buscar gifs"),
                      );
                    } else {
                      return GifTableWidget(
                        context: context,
                        snapshot: snapshot,
                        search: _search,
                        onTapLoadMore: () {
                          setState(
                            () {
                              _offset += 25;
                            },
                          );
                        },
                      );
                    }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
