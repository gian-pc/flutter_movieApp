import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_codigo3_movieapp/models/movie_detail_model.dart';
import 'package:flutter_codigo3_movieapp/models/movie_model.dart';
import 'package:flutter_codigo3_movieapp/utils/constantes.dart';
import 'package:http/http.dart' as http;

class DetailMoviePage extends StatefulWidget {
  Movie movie;
  DetailMoviePage({required this.movie});

  @override
  _DetailMoviePageState createState() => _DetailMoviePageState();
}

class _DetailMoviePageState extends State<DetailMoviePage> {
  MovieDetail? movieDetail;

  @override
  initState() {
    super.initState();
    getDataMovie();
  }

  getDataMovie() async {
    String path = "$urlBase/movie/${widget.movie.id}?api_key=$api_key";
    Uri _uri = Uri.parse(path);
    http.Response response = await http.get(_uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = json.decode(response.body);
      movieDetail = MovieDetail.fromJson(myMap);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> itemsList = List.generate(
      20,
      (index) => Container(
        height: 150,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        width: double.infinity,
        color: Colors.blueAccent,
      ),
    );

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            child: Image.network(
              "https://fondosmil.com/fondo/7351.jpg",
              fit: BoxFit.fitHeight,
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.grey.withOpacity(0.1),
            ),
          ),
          CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text("My Movie"),
                expandedHeight: 240.0,
                floating: true,
                pinned: true,
                //snap: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("Justice League"),
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        "https://fondosmil.com/fondo/7351.jpg",
                        fit: BoxFit.cover,
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                          colors: [
                            Color(0x002E2E2E),
                            Color(0xff2E2E2E),
                          ],
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                        )),
                      )
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    ListView.builder(
                      itemCount: 50,
                      primary: true,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Text("Hola");
                      },
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
