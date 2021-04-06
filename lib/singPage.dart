import 'package:flutter/material.dart';
import 'package:flutter_app/loginPage.dart';
import 'package:flutter_app/registerPage.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignPage extends StatefulHookWidget {

  @override
  _SignState createState() => _SignState();
}

class _SignState extends State<SignPage> {

  AnimationController _controllerAnimation;
  bool _isLoginPressed = true;

  @override
  Widget build(BuildContext context) {
    _controllerAnimation= useAnimationController(duration: Duration(milliseconds: 400));

    return Scaffold(
        body: LayoutBuilder(
            builder: (context, constraints) {
              double height                     = constraints.maxHeight;
              double transformLengthInLogin     = height * 0.43;
              double transformLengthInRegister  = height * 0.6;
              double heightBottomPageInLogin    = height * 0.35;
              double heightBottomPageInRegister = height * 0.5;

              return Stack(
                  children: [
                    AnimatedBuilder(
                        animation: _controllerAnimation,
                        builder: (context, child) {
                          return Transform.translate(
                              offset: Offset(0, _controllerAnimation.value * -(_isLoginPressed ? transformLengthInLogin : transformLengthInRegister)),
                              child: Container(
                                  decoration: _background(),
                                  width: double.infinity,
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Transform.translate(
                                            offset: Offset(0, _controllerAnimation.value * (_isLoginPressed ? height * 0.4 : height * 0.46)),
                                            child: SvgPicture.asset(
                                                'resources/images/logo.svg',
                                                height: _controllerAnimation.value == 0 ? height * 0.3 : (1 - _controllerAnimation.value / 6) * height * 0.27
                                            )
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                            child: Opacity(
                                                opacity: 1 - _controllerAnimation.value,
                                                child: Transform.translate(
                                                    offset: Offset(0, _controllerAnimation.value * (_isLoginPressed ? height * 0.4 : height * 0.5) * 2),
                                                    child: Column(
                                                        children: [
                                                          Padding(
                                                              padding: const EdgeInsets.only(bottom: 10),
                                                              child: NeumorphicButton(
                                                                  onPressed: () {
                                                                    _isLoginPressed = true;
                                                                    _controllerAnimation.forward();
                                                                  },
                                                                  child: Center(child: Text('Login', style: TextStyle(color: Colors.black))),
                                                                  padding: EdgeInsets.all(10),
                                                                  style: NeumorphicStyle(
                                                                      shape: NeumorphicShape.convex,
                                                                      depth: 11,
                                                                      surfaceIntensity: 0,
                                                                      color: Color(0xFFEFCBCB)
                                                                  )
                                                              )
                                                          ),
                                                          NeumorphicButton(
                                                              onPressed: () {
                                                                _isLoginPressed = false;
                                                                _controllerAnimation.forward();
                                                              },
                                                              child: Center(child: Text('Register', style: TextStyle(color: Colors.black))),
                                                              padding: EdgeInsets.all(10),
                                                              style: NeumorphicStyle(
                                                                  shape: NeumorphicShape.convex,
                                                                  depth: 11,
                                                                  surfaceIntensity: 0,
                                                                  color: Color(0xFFEFCBCB)
                                                              )
                                                          )
                                                        ]
                                                    )
                                                )
                                            )
                                        )
                                      ]
                                  )
                              )
                          );
                        }
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: AnimatedBuilder(
                            animation: _controllerAnimation,
                            builder: (context, child) {
                              return FadeTransition(
                                opacity: _controllerAnimation,
                                child: Transform.translate(
                                  offset: Offset(
                                      0,
                                      _controllerAnimation.value == 0
                                          ? height * 0.5
                                          : _isLoginPressed
                                          ? _controllerAnimation.value * -(transformLengthInLogin - heightBottomPageInLogin) + 20 // 20 is button radius size
                                          : _controllerAnimation.value * -(transformLengthInRegister - heightBottomPageInRegister) + 20
                                  ),
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        NeumorphicButton(
                                            onPressed: () => _controllerAnimation.reverse().then((_) => _isLoginPressed = true),
                                            child: Icon(Icons.close, size: 25, color: Colors.black),
                                            padding: EdgeInsets.all(10),
                                            style: NeumorphicStyle(
                                                shape: NeumorphicShape.convex,
                                                boxShape: NeumorphicBoxShape.circle(),
                                                depth: 9,
                                                surfaceIntensity: 0,
                                                color: Color(0xFFF5EFEF),
                                                lightSource: LightSource.bottomRight
                                            )
                                        ),
                                        Container(
                                            height: _isLoginPressed ? heightBottomPageInLogin : heightBottomPageInRegister,
                                            width: double.infinity,
                                            child: _isLoginPressed ? LoginPage() : RegisterPage()
                                        )
                                      ]
                                  )
                                )
                              );
                            }
                        )
                      )
                    )
                  ]
              );
            }
        )
    );
  }

  BoxDecoration _background() {
    return BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(MediaQuery
            .of(context)
            .size
            .width, _controllerAnimation.value == 0 ? 0 : 100)),
        gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [
              Color(0xFF654ea3),
              Color(0xFFeaafc8)
            ]
        )
    );
  }
}