

import 'package:flutter/material.dart';
final navigatorKey = GlobalKey<NavigatorState>();
void navigatorTo(Widget page){
  Navigator.push(navigatorKey.currentContext!,
      MaterialPageRoute(builder: (c) {
    return page;
  }));
}