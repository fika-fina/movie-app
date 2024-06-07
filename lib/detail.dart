import 'package:flutter/material.dart';

import 'movie.dart';

class DetailPage extends StatelessWidget{
  const DetailPage({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Column(
              children: [
                Image.network(movie.Poster, height: 300,),
                Text(movie.Title),
                Text(movie.Year),
              ],
            ),
          ],
        ),
      ),
    );

  }


}