enum Flavor {
  PRODUCTION,
  STAGING,
}

class F {
  static Flavor? appFlavor;

  static String get title {
    switch (appFlavor) {
      case Flavor.PRODUCTION:
        return 'TheMovieDB';
      case Flavor.STAGING:
        return 'TheMovieDB-Staging';
      default:
        return 'title';
    }
  }

}
