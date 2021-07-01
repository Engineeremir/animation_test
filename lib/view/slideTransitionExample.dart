import 'package:flutter/material.dart';

class SlideTransitionExample extends StatefulWidget {
  const SlideTransitionExample({Key? key}) : super(key: key);

  @override
  _SlideTransitionExampleState createState() => _SlideTransitionExampleState();
}

class _SlideTransitionExampleState extends State<SlideTransitionExample> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(vsync: this,duration: Duration(seconds: 2));
    _slideAnimation = Tween<Offset>(
      begin: Offset(0,-1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.elasticOut));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SlideTransition(
            position: _slideAnimation,
            child: SizedBox.expand(
              child: FlutterLogo(),
            ),
          ),
          Positioned(
            right: 48,
            bottom: 48,
            child: GestureDetector(onTap: (){
              _animationController.reverse();
            },child: Icon(Icons.arrow_upward)),
          ),
          Positioned(
            left: 48,
            bottom: 48,
            child: GestureDetector(onTap: (){
              _animationController.forward();
            },child: Icon(Icons.arrow_downward)),
          )
        ],
      ),
    );
  }
}
