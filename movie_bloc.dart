import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:examproject/model/movie_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial()) {
    on<MovieEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<getevent>((event, emit) async {
      emit(dataloading());

      try {
        String url =
            "http://www.omdbapi.com/?apikey=c585efc2&s=Batman&page=${event.page}";
        var response = await http.get(Uri.parse(url));

        if (response.statusCode == 200) {
          var data = await jsonDecode(response.body);

          if (data['Search'] != null) {
            List value = data['Search'];
            List<moviedetails> result =
                await value.map((e) => moviedetails.fromJson(e)).toList();
            emit(dataloaded(value: result, currentPage: event.page));
          }
        } else {
          print('error');
        }
      } catch (e) {
        print(e.toString());

        emit(dataerror(error: e.toString()));
      }
    });
    on<getmoviedetails>((event, emit) async {
      emit(dataloading());

      try {
        String url = "http://www.omdbapi.com/?apikey=c585efc2&i=${event.id}";
        var response = await http.get(Uri.parse(url));

        if (response.statusCode == 200) {
          var data = await jsonDecode(response.body);
          var movie = moviedetails.fromJson(data);

          emit(moviedetailsdataloaded(
            value: movie,
          ));
        }
      } catch (e) {
        print(e.toString());

        emit(dataerror(error: e.toString()));
      }
    });
  }
}
