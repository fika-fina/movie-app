import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'detail.dart';
import 'movie.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController searchController = TextEditingController();
  List<Movie> movies = [];

  Future<Movies> fetchMovies() async {
    print(searchController.text);
    try{
      print(searchController.text);
      final response = await http.get(Uri.parse('http://www.omdbapi.com/?apikey=748ffff2&s=${searchController.text}'));

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        return Movies.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load album');
      }
    }
    catch(e){
      print(e);
      return Movies(Search: [], Response: "", totalResults: "");
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar (
        title: TextField(
          controller: searchController,
        ),
        actions: [
          ElevatedButton(onPressed: () async {
            Movies movieRespones = await fetchMovies();
            setState(() {
              movies = movieRespones.Search;
            });

          }, child: Text("Search"))

        ],
      ),

      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (BuildContext contex, int index){
        return Card(
          child: ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                return DetailPage(movie: movies[index]);
              }));
            },
            title: Text(movies[index].Title),
            subtitle: Text(movies[index].Year),
            leading: Image.network(movies[index].Poster),
            trailing: Icon(CupertinoIcons.right_chevron),
          
          ),
        );
      },

    ));
    throw UnimplementedError();
  }

}