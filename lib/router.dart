import 'package:api_demo/views/album_screen.dart';
import 'package:api_demo/views/posts_screen.dart';
import 'package:api_demo/views/user_screen.dart';
import 'package:flutter/material.dart';

import 'main.dart';


class RouterApp {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) =>  HomeScreen());
      case Routes.userScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const UserScreen());
      case Routes.postsscreen:
        return MaterialPageRoute(builder: (BuildContext context) =>  PostScreen());
      case Routes.albumscreen:
        return MaterialPageRoute(builder: (BuildContext context) =>  AlbumScreen());
      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => Scaffold(
            body: Center(
              child: Text('The Page ${settings.name} does not exists.'),
            ),
          ),
        );
    }
  }
}

class Routes {
  static const String homeScreen = '/homeScreen';
  static const String userScreen = '/userScreen';
  static const String albumscreen = '/albumscreen';
  static const String postsscreen = '/postsscreen';
  static const String noInternetScreen = '/noInternetScreen';
}