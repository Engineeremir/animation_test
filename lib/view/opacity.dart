import 'package:flutter/material.dart';

class OpacityAnimation extends StatefulWidget {
  const OpacityAnimation({Key? key}) : super(key: key);

  @override
  _OpacityAnimationState createState() => _OpacityAnimationState();
}

class _OpacityAnimationState extends State<OpacityAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
    AnimationController(vsync: this, duration: Duration(seconds: 1))
      ..addListener(() {
        setState(() {

        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        } else if (status == AnimationStatus.completed) {
          _animationController.reverse();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
          onTap: (){
            if (_animationController.status == AnimationStatus.dismissed) {
              _animationController.forward();
            } else if (_animationController.status == AnimationStatus.completed) {
              _animationController.reverse();
            }
          },
          child: Opacity(
            opacity: _animationController.value,
            child: Center(
              child: SizedBox(
                height: 200,
                width: 200,
                child: FlutterLogo(),
              ),
            ),
          ),
        )
    );
  }
}
