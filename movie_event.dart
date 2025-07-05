part of 'movie_bloc.dart';

@immutable
class MovieEvent {}

class getevent extends MovieEvent {
  final int page;
  getevent({this.page = 1});
}

class getmoviedetails extends MovieEvent {
  String id;
  getmoviedetails({required this.id});
}
