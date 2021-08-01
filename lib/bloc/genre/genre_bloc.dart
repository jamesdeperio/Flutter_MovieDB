import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_moviedbapp/core/api/APIService.dart';
import 'package:flutter_moviedbapp/core/model/genre/genre.dart';

import 'genre_bloc_event.dart';
import 'genre_bloc_state.dart';

class GenreBloc extends Bloc<GenreEvent, GenreState> {
  GenreBloc() : super(GenreLoading());

  @override
  Stream<GenreState> mapEventToState(GenreEvent event) async* {
    if (event is GenreEventStarted) {
      yield* _mapMovieEventStateToState();
    }
  }

  Stream<GenreState> _mapMovieEventStateToState() async* {
    final service = APIService();
    yield GenreLoading();
    try {
      List<Genre> genreList = await service.getGenreList();

      yield GenreLoaded(genreList);
    } on Exception catch (e) {
      print(e);
      yield GenreError();
    }
  }
}