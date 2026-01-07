import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LoadingCupertino extends StatelessWidget {
  const LoadingCupertino({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        CupertinoButton(
          child: Text("Contoh button"),
          onPressed: null,
        ),
        CupertinoActivityIndicator(),
      ],
    );
  }
}