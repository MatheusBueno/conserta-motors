import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

import 'package:conserta_motors/animation/Loading.animation.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  int statusClick = 0;

  AnimationController singInButtonAnimationController;

  @override
  void initState() {
    super.initState();
    singInButtonAnimationController = AnimationController(
      duration: new Duration(milliseconds: 2500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    singInButtonAnimationController.dispose();
  }

  Future<Null> _playAnimation() async {
    try {
      await singInButtonAnimationController.forward();
      await singInButtonAnimationController.reverse();
    } on TickerCanceled {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.indigo,
        ),
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(height: 300),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: TextField(
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                        ),
                        cursorColor: const Color.fromRGBO(247, 64, 106, 1.0),
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: const Color.fromRGBO(247, 64, 106, 1.0),
                            ),
                            borderRadius:
                                BorderRadius.all(const Radius.circular(30)),
                          ),
                          hintText: 'E-mail',
                          hintStyle: TextStyle(color: Colors.white70),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius:
                                BorderRadius.all(const Radius.circular(30)),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius:
                                BorderRadius.all(const Radius.circular(30)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 210),
                    statusClick == 0
                        ? FlatButton(
                            onPressed: () {},
                            child: Text(
                              'Não tem uma conta? Crie uma aqui',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
                statusClick == 0
                    ? InkWell(
                        onTap: () {
                          setState(() {
                            statusClick = 1;
                          });
                          _playAnimation().whenComplete(() => statusClick = 0);
                        },
                        child: SingInButton(),
                      )
                    : SingInStartAnimation(
                        buttonController: singInButtonAnimationController.view),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SingInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: FractionalOffset.center,
          width: 300,
          height: 45,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(247, 64, 106, 1.0),
            borderRadius: BorderRadius.all(const Radius.circular(30)),
          ),
          child: Text(
            'Login',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w300,
              letterSpacing: 0.3,
            ),
          ),
        ),
        SizedBox(height: 70),
      ],
    );
  }
}
