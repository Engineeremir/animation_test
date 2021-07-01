import 'package:animationtest/view/animatedBuilder.dart';
import 'package:animationtest/view/fadeTransition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'view/slideTransitionExample.dart';
import 'view/opacity.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedBuilderExample(),
    );
  }
}


