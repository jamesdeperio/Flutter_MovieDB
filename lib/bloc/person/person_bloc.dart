import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_moviedbapp/bloc/person/person_bloc_event.dart';
import 'package:flutter_moviedbapp/bloc/person/person_bloc_state.dart';
import 'package:flutter_moviedbapp/core/api/APIService.dart';
import 'package:flutter_moviedbapp/core/model/person/person.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  PersonBloc() : super(PersonLoading());

  @override
  Stream<PersonState> mapEventToState(PersonEvent event) async* {
    if (event is PersonEventStated) {
      yield* _mapMovieEventStartedToState();
    }
  }

  Stream<PersonState> _mapMovieEventStartedToState() async* {
    final apiRepository = APIService();
    yield PersonLoading();
    try {
      print('Genrebloc called.');
      final List<Person> movies = await apiRepository.getTrendingPerson();
      yield PersonLoaded(movies);
    }  catch (error, stacktrace) {
      print('Exception : $error with stacktrace: $stacktrace');
      yield PersonError();
    }
  }
}