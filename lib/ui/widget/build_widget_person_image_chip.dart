
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_moviedbapp/core/model/person/person.dart';
import 'package:flutter_moviedbapp/ui/widget/build_widget_loading_indicator.dart';

class BuildPersonImageChip extends StatelessWidget {
  late final List<Person> personList;

  BuildPersonImageChip(List<Person> personList) {
    this.personList = personList;
  }

  @override
  Widget build( context) {
    return Container(
      height: 110,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: personList.length,
        separatorBuilder:
            (context, index) =>
            VerticalDivider(
              color: Colors.transparent,
              width: 5,
            ),
        itemBuilder: (context, index) {
          Person person =
          personList[index];
          return Container(
            child: Column(
              children: <Widget>[
                Card(
                  shape:
                  RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius
                        .circular(
                        100),
                  ),
                  elevation: 3,
                  child: ClipRRect(
                    child:
                    CachedNetworkImage(
                      imageUrl:
                      'https://image.tmdb.org/t/p/w200${person.profilePath}',
                      imageBuilder: (context,
                          imageProvider) {
                        return Container(
                          width: 80,
                          height: 80,
                          decoration:
                          BoxDecoration(
                            borderRadius:
                            BorderRadius
                                .all(
                              Radius
                                  .circular(
                                  100),
                            ),
                            image:
                            DecorationImage(
                              image:
                              imageProvider,
                              fit: BoxFit
                                  .cover,
                            ),
                          ),
                        );
                      },
                      placeholder:
                          (context,
                          url) =>
                          Container(
                            width: 80,
                            height: 80,
                            child: Center(
                              child: BuildWidgetLoadingIndicator(),
                            ),
                          ),
                      errorWidget:
                          (context, url,
                          error) =>
                          Container(
                            width: 80,
                            height: 80,
                            decoration:
                            BoxDecoration(
                              image:
                              DecorationImage(
                                image: AssetImage(
                                    'assets/images/img_not_found.jpg'),
                              ),
                            ),
                          ),
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text(
                      "${person.name!.toUpperCase()}",
                      style: TextStyle(
                        color: Colors
                            .black45,
                        fontSize: 8,
                        fontFamily:
                        'muli',
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text(
                      "${person.knowForDepartment?.toUpperCase()}",
                      style: TextStyle(
                        color: Colors
                            .black45,
                        fontSize: 8,
                        fontFamily:
                        'muli',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

}