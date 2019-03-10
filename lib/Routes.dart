import 'package:flutter/material.dart';

import 'package:conserta_motors/pages/login.page.dart';

class Routes {
  Routes() {
    runApp(new MaterialApp(
      title: "Conserta Motors",
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/login':
            return MyCustomRoute(
              builder: (_) => LoginPage(),
              settings: settings,
            );

          case '/home':
            return MyCustomRoute(
              // builder: (_) => new HomeScreen(),
              settings: settings,
            );
        }
      },
    ));
  }
}

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;
    return new FadeTransition(opacity: animation, child: child);
  }
}
