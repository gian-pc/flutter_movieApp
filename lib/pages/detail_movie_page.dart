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
      body: movieDetail != null
          ? Stack(
              children: [
                // Container(
                //   height: double.infinity,
                //   child: Image.network(
                //     "https://fondosmil.com/fondo/7351.jpg",
                //     fit: BoxFit.fitHeight,
                //   ),
                // ),
                // BackdropFilter(
                //   filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                //   child: Container(
                //     color: Colors.grey.withOpacity(0.1),
                //   ),
                // ),
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
                        title: Text(movieDetail!.originalTitle),
                        background: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.network(
                              pathImage + movieDetail!.backdropPath,
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
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Row(
                              children: [
                                Container(
                                  width: 120.0,
                                  height: 176.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(pathImage +
                                              movieDetail!.posterPath))),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(movieDetail!.originalTitle,
                                          style: TextStyle(fontSize: 22.0)),
                                      SizedBox(height: 4.0),
                                      Text("(${movieDetail!.title})",
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.white54)),
                                      SizedBox(height: 6.0),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.date_range,
                                            size: 15,
                                          ),
                                          Text(movieDetail!.releaseDate
                                              .toString()
                                              .substring(0, 10)),
                                        ],
                                      ),
                                      SizedBox(height: 6.0),
                                      Row(
                                        children: [
                                          Icon(Icons.timer, size: 15),
                                          Text(
                                              "${movieDetail!.runtime.toString()} min."),
                                        ],
                                      ),
                                      SizedBox(height: 6.0),
                                      Row(
                                        children: [
                                          Icon(Icons.star, size: 15),
                                          Text(
                                              "${movieDetail!.voteAverage.toString()}"),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 12.0),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: ElevatedButton.icon(
                              icon: Icon(Icons.add),
                              onPressed: () {},
                              label: Container(
                                margin: EdgeInsets.symmetric(vertical: 16.0),
                                child: Text(
                                  "Add to watchList",
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  elevation: 8,
                                  shadowColor:
                                      Color(0xffFF9F02).withOpacity(0.9),
                                  primary: Color(0xffFF9F02)),
                            ),
                          ),
                          SizedBox(height: 18),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                              "Overview",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0,vertical: 6.0),
                            child: Text(
                              movieDetail!.overview,
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          SizedBox(height: 18.0),
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                              "Genres",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
