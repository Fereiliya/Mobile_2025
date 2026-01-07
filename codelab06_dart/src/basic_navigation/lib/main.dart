import 'package:basic_navigation/pages/home_page.dart';
import 'package:basic_navigation/pages/item_page.dart';
import 'package:flutter/material.dart';
import 'package:basic_navigation/models/items.dart';
import 'package:go_router/go_router.dart';

//Config
final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/item',
      builder: (context, state) {
        final item = state.extra as Items;
        return ItemPage(item: item,);
      },
    )
  ]
);

void main() {
  runApp(
    MaterialApp.router(
      routerConfig: _router,
    )
  );
}