

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_moviedbapp/bloc/movie/movie_bloc.dart';
import 'package:flutter_moviedbapp/bloc/movie/movie_bloc_event.dart';
import 'package:flutter_moviedbapp/bloc/movie/movie_bloc_state.dart';
import 'package:flutter_moviedbapp/bloc/person/person_bloc.dart';
import 'package:flutter_moviedbapp/bloc/person/person_bloc_event.dart';
import 'package:flutter_moviedbapp/bloc/person/person_bloc_state.dart';
import 'package:flutter_moviedbapp/core/model/movie/movie.dart';
import 'package:flutter_moviedbapp/core/model/person/person.dart';
import 'package:flutter_moviedbapp/theme/app_theme.dart';
import 'package:flutter_moviedbapp/ui/home/movie_detail_screen.dart';
import 'package:flutter_moviedbapp/ui/widget/build_widget_category.dart';
import 'package:flutter_moviedbapp/ui/widget/build_widget_loading_indicator.dart';
import 'package:flutter_moviedbapp/ui/widget/build_widget_person_image_chip.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/HomeScreen";

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieBloc>(
          create: (_) => MovieBloc()..add(MovieEventStarted(0, '')),
        ),
        BlocProvider<PersonBloc>(
          create: (_) => PersonBloc()..add(PersonEventStated()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MovieDBAppTheme.primaryColor,
          elevation: 0,
          leading: Icon(
            Icons.menu,
            color:  MovieDBAppTheme.white,
          ),
          title: Text(
            'TheMovieDB'.toUpperCase(),
            style: Theme.of(context).textTheme.caption!.copyWith(
              color: MovieDBAppTheme.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'muli',
            ),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 15),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/logo.png'),
              ),
            ),
          ],
        ),
        body: _buildBody(context),
    ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
               Stack(
                 children: [
                   ClipPath(
                     child: ClipRRect(
                       child: CachedNetworkImage(
                         imageUrl: 'https://www.themoviedb.org/t/p/w1920_and_h600_multi_faces_filter(duotone,032541,01b4e4)/7VrRna8S3x6xbijooeBmxqvHXiu.jpg',
                         height: MediaQuery.of(context).size.height / 2,
                         width: double.infinity,
                         fit: BoxFit.cover,
                         errorWidget: (context, url, error) => Container(
                           decoration: BoxDecoration(
                             image: DecorationImage(image: AssetImage('assets/images/img_not_found.jpg'),),
                           ),
                         ),
                       ),
                       borderRadius: BorderRadius.only(
                         bottomLeft: Radius.circular(30),
                         bottomRight: Radius.circular(30),
                       ),
                     ),
                   ),
                   Column(
                     children: [
                       Align(
                         alignment: Alignment.centerLeft,
                         child: Container(
                           margin: EdgeInsets.only(left: 15, top:  (MediaQuery.of(context).size.height / 5.5) ) ,
                           child:  Text('Welcome.',
                               textAlign: TextAlign.start,
                               style: TextStyle(
                                 color: Colors.white,
                                 fontFamily: 'muli',
                                 fontSize: 35,
                                 fontWeight: FontWeight.bold,
                               )
                           ),
                         ),
                       ),
                       Align(
                         alignment: Alignment.centerLeft,
                         child: Container(
                             margin: EdgeInsets.only(left: 15, top: 15, right:15),
                             child: Text('Millions of movies, TV shows and people to discover. Explore now.',
                               textAlign: TextAlign.start,
                               style: TextStyle(
                                 color: Colors.white,
                                 fontFamily: 'muli',
                                 fontSize: 25,
                                 fontWeight: FontWeight.normal,
                               ))
                         ),
                       )
                     ],
                   )

                 ],
               ),

                BlocBuilder<MovieBloc, MovieState>(
                  builder: (context, state) {
                    if (state is MovieLoading) {
                      return BuildWidgetLoadingIndicator();
                    }
                    else if (state is MovieLoaded) {
                      List<Movie> movies = state.movieList;
                      return _buildMovieContent(movies);
                    } else {
                      return Container(
                        child: Text('Something went wrong!!!'),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _buildMovieContent(List<Movie> movies) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: EdgeInsets.only(left:0.0, top:20.0,right:0.0,bottom:20.0),
        child:  CarouselSlider(
          options: CarouselOptions(
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            pauseAutoPlayOnTouch: true,
            viewportFraction: 0.8,
            enlargeCenterPage: true,
          ),
          items: movies.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                    onTap: (){
                      MovieDetailScreen.navigateToDetailScreen(context, i);
                    },
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: <Widget>[
                        ClipRRect(
                          child: CachedNetworkImage(
                            imageUrl:
                            'https://image.tmdb.org/t/p/original/${i.backdropPath}',
                            height:
                            MediaQuery.of(context).size.height /
                                3,
                            width:
                            MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                            Platform.isAndroid
                                ? CircularProgressIndicator()
                                : CupertinoActivityIndicator(),
                            errorWidget: (context, url, error) =>
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/img_not_found.jpg'),
                                    ),
                                  ),
                                ),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: 15,
                            left: 15,
                          ),
                          child: Text(
                            "${i.title!.toUpperCase()}",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              fontFamily: 'muli',
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    )
                );
              },
            );
          }).toList(),

        )
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 12,
            ),
            BuildWidgetCategory(),
            Container(
                margin: EdgeInsets.only(left:0.0, top:20.0,right:0.0,bottom:0.0),
                child:  Text(
                  'Trending persons on this week'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45,
                    fontFamily: 'muli',
                  ),
                )
            ),
            SizedBox(
              height: 12,
            ),
            Column(
              children: <Widget>[
                BlocBuilder<PersonBloc, PersonState>(
                  builder: (context, state) {
                    if (state is PersonLoading) {
                      return Center();
                    } else if (state is PersonLoaded) {
                      List<Person> personList = state.personList;
                      return BuildPersonImageChip(personList);
                    } else {
                      print("persong error");
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    ]
  );
}