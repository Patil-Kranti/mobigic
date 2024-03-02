import 'package:flutter/material.dart';
import 'package:mobigic_test/ui/views/board_screen.dart';
import 'package:mobigic_test/ui/views/row_column_selector_screen.dart';

const String initialRoute = "login";

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/rowColumnSelectorScreen':
        return MaterialPageRoute(
          builder: (_) => const RowColumnSelectorScreen(),
        );
      case '/boardScreen':
        var page = settings.arguments as Map<String, dynamic>;

        return MaterialPageRoute(
          builder: (_) =>  BoardScreen(pageData:page),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
