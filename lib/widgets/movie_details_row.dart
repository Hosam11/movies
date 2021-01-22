import 'package:flutter/material.dart';
import 'package:moviesapi/data_access_layer/model/movie.dart';
import 'package:moviesapi/widgets/movie_genre_list.dart';

class MovieDetailsRow extends StatelessWidget {
  final Result result;

  MovieDetailsRow({this.result});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        // Title Text
        Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Text(
                result.title,
                style: Theme.of(context).textTheme.headline6,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.justify,
              ),
            )
          ],
        ),
        SizedBox(
          height: 8,
        ),
        //TODO genre listView
        Container(
          height: 30,
          // send id to build MovieGenreList
          child: MovieGenreList(id: result.id),
        ),
        SizedBox(
          height: 8,
        ),
        // Release Data Text
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              ('Release On ' +
                  result.releaseDate.day.toString() +
                  "/" +
                  result.releaseDate.month.toString() +
                  "/" +
                  result.releaseDate.year.toString()),
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        // Overview Text
        Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Text(
                result.overview,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
