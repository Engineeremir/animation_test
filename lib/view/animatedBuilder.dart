import 'package:flutter/material.dart';

class AnimatedBuilderExample extends StatefulWidget {
  const AnimatedBuilderExample({Key? key}) : super(key: key);

  @override
  _AnimatedBuilderExampleState createState() => _AnimatedBuilderExampleState();
}

class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _sizeValue;
  late Animation<double> _marginValue;
  late Animation<double> _rotationValue;
  late Animation<Color?> _firstRectangleColorAnimation;
  late Animation<Color?> _secondRectangleColorAnimation;
  late Animation<Color?> _thirdRectangleColorAnimation;
  late Animation<Offset> _bottomElement;
  late Animation<Offset> _topElement;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3))
          ..forward();
    _sizeValue = Tween<double>(begin: 0, end: 100).animate(CurvedAnimation(
        parent: _animationController, curve: Interval(0.0, 0.3)));
    _marginValue = Tween<double>(begin: 0, end: 25).animate(CurvedAnimation(
        parent: _animationController, curve: Interval(0.0, 0.3)));
    _rotationValue = Tween<double>(begin: 0, end: 0.25).animate(CurvedAnimation(
        parent: _animationController, curve: Interval(0.6, 0.75)));
    _firstRectangleColorAnimation =
        ColorTween(begin: Colors.red, end: Colors.green).animate(
            CurvedAnimation(
                parent: _animationController, curve: Interval(0.3,0.6, curve: Curves.fastOutSlowIn) ));
    _secondRectangleColorAnimation =
        ColorTween(begin: Colors.red, end: Colors.amber).animate(
            CurvedAnimation(
                parent: _animationController, curve: Interval(0.3,0.6, curve: Curves.fastOutSlowIn)));
    _thirdRectangleColorAnimation =
        ColorTween(begin: Colors.red, end: Colors.blue).animate(CurvedAnimation(
            parent: _animationController, curve:Interval(0.3,0.6, curve: Curves.fastOutSlowIn)));
    _bottomElement = Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
        .animate(CurvedAnimation(
            parent: _animationController, curve: Interval(0.75, 1)));
    _topElement = Tween<Offset>(begin: Offset(0, -1), end: Offset.zero).animate(
        CurvedAnimation(
            parent: _animationController, curve: Interval(0.75, 1)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedBuilder(
      animation: _animationController,
      builder: (_, __) {
        return Center(
          child: RotationTransition(
            turns: _rotationValue,
            child: SizedBox(
              height: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SlideTransition(
                    position: _topElement,
                    child: Container(
                      color: _firstRectangleColorAnimation.value,
                      width: _sizeValue.value,
                      margin: EdgeInsets.only(right: _marginValue.value),
                    ),
                  ),
                  Container(
                    color: _secondRectangleColorAnimation.value,
                    width: _sizeValue.value,
                  ),
                  SlideTransition(
                    position: _bottomElement,
                    child: Container(
                      color: _thirdRectangleColorAnimation.value,
                      width: _sizeValue.value,
                      margin: EdgeInsets.only(left: _marginValue.value),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}
