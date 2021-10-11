import 'package:flutter/material.dart';

class MainBackground extends StatelessWidget {
  final Widget child;
  const MainBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            // top: 0,
            child: Image(
              image: AssetImage('assets/images/bottom-center.png'),
            ),
          ),
          child,
        ],
      ),
    );
  }
}

class BottomRightBackground extends StatelessWidget {
  final Widget child;
  const BottomRightBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: Image(
              image: AssetImage('assets/images/bottom-right.png'),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
