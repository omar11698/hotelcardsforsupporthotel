
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotelcardsforsupporthotel/Listing_hotels/presentation/pages/hotels_list_screen.dart';

import '../main.dart';
import 'DI.dart';

const String homeRoute='/';
const String hotelCardsRoute='/hotelcardsroute';


class NavigationRouter{
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case homeRoute:
        // initGetWeatherModule();
        return MaterialPageRoute(builder: (_) => const MyHomePage(title: "List of hotel cards"));
       case hotelCardsRoute:
              initGetHotelsModule();
              return MaterialPageRoute(builder: (_) => const HotelsListScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}