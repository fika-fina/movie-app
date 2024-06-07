import 'package:flutter/material.dart';

class Movies{
  final List<Movie> Search;
  final String totalResults;
  final String Response;

  Movies({
    required this.Search,
    required this.Response,
    required this.totalResults});

  factory Movies.fromJson(Map<String, dynamic> json) {

    var search = json ['Search'] as List;
    // convert from json to movie
    List<Movie> movieList = search.map((e) => Movie.fromJson(e)).toList();
    return Movies(
        Search: movieList,
        Response: json ['Response'],
        totalResults: json ['totalResults']);
  }

}

class Movie{
  final String Title;
  final String Year;
  final String imdbID;
  final String Poster;
  final String Type;

  Movie({
    required this.Title,
    required this.Year,
    required this.imdbID,
    required this.Poster,
    required this.Type});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        Title: json ['Title'],
        Year: json['Year'],
        imdbID: json['imdbID'],
        Poster: json['Poster'],
        Type: json['Type']);
  }

}
