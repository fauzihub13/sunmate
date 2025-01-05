import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/data/routing/routes.dart';
import 'package:flutter_sunmate/src/presentation/auth/pages/login_page.dart';
import 'package:flutter_sunmate/src/presentation/notification/pages/notification_list_page.dart';

class Routing {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case Routes.notificationListPage:
        return MaterialPageRoute(builder: (context) => const NotificationListPage());

      default:
        return MaterialPageRoute(builder: (context)=> const NoRouteScreen());
    }
  }
}

class NoRouteScreen extends StatelessWidget {
  const NoRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('No routes found'),
      ),
    );
  }
}
