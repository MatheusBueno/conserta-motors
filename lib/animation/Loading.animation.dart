import 'package:flutter/material.dart';

import 'package:flutter/animation.dart';

class SingInStartAnimation extends StatefulWidget {
  SingInStartAnimation({Key key, this.buttonController})
      : shrinkButtonAnimation = Tween(
          begin: 300.0,
          end: 70.0,
        ).animate(new CurvedAnimation(
            parent: buttonController, curve: new Interval(0.0, 0.250))),
        super(key: key);

  final AnimationController buttonController;

  final Animation shrinkButtonAnimation;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Column(
      children: <Widget>[
        Container(
          alignment: FractionalOffset.center,
          width: shrinkButtonAnimation.value,
          height: 45,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(247, 64, 106, 1.0),
            borderRadius: BorderRadius.all(const Radius.circular(30)),
          ),
          child: shrinkButtonAnimation.value > 75
              ? Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.3,
                  ),
                )
              : CircularProgressIndicator(
                  strokeWidth: 1,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
        ),
        SizedBox(height: 22),
      ],
    );
  }

  @override
  _SingInStartAnimationState createState() => _SingInStartAnimationState();
}

class _SingInStartAnimationState extends State<SingInStartAnimation> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: widget._buildAnimation,
      animation: widget.buttonController,
    );
  }
}
