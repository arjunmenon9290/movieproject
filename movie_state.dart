part of 'movie_bloc.dart';

@immutable
class MovieState {}

class MovieInitial extends MovieState {}

class dataloaded extends MovieState {
  List<moviedetails> value;
  final int currentPage;
  dataloaded({required this.value, required this.currentPage});
}

class moviedetailsdataloaded extends MovieState {
  moviedetails value;
  moviedetailsdataloaded({required this.value});
}

class dataloading extends MovieState {}

class dataerror extends MovieState {
  String error;
  dataerror({required this.error});
}
