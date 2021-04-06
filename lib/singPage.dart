import 'package:flutter/material.dart';
import 'package:flutter_app/loginPage.dart';
import 'package:flutter_app/registerPage.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignPage extends StatefulHookWidget {

  @override
  _SignState createState() => _SignState();
}

class _SignState extends State<SignPage> {

  AnimationController _controllerAnimation, _controllerSign;
  bool _isLoginPressed = true;
  double _left = 150;

  @override
  Widget build(BuildContext context) {
    _controllerAnimation = useAnimationController(duration: Duration(milliseconds: 400));
    _controllerSign      = useAnimationController(duration: Duration(milliseconds: 1200), lowerBound: 0.5)..repeat();

    return Scaffold(
        body: LayoutBuilder(
            builder: (context, constraints) {
              double height                     = constraints.maxHeight;
              double transformLengthInLogin     = height * 0.43;
              double transformLengthInRegister  = height * 0.6;
              double heightBottomPageInLogin    = height * 0.35;
              double heightBottomPageInRegister = height * 0.5;

              return Stack(
                  fit: StackFit.expand,
                  children: [
                    AnimatedBuilder(
                        animation: _controllerAnimation,
                        builder: (context, child) {
                          return Transform.translate(
                              offset: Offset(0, _controllerAnimation.value * -(_isLoginPressed ? transformLengthInLogin : transformLengthInRegister)),
                              child: Container(decoration: _background())
                          );
                        }
                    ),
                    AnimatedBuilder(
                      animation: _controllerAnimation,
                      builder: (context, _) => FractionallySizedBox(
                          heightFactor: _controllerAnimation.value == 0 ? 0.3 : (1 - _controllerAnimation.value / 6) * 0.27,
                          child: Transform.translate(
                              offset: Offset(0, _controllerAnimation.value * -(_isLoginPressed ? height * 0.2 : height * 0.26)),
                              child: SvgPicture.asset('resources/images/logo.svg')
                          )
                      )
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
                    ),
                    _dragDetector()
                  ]
              );
            }
        )
    );
  }

  BoxDecoration _background() {
    return BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(MediaQuery.of(context).size.width, _controllerAnimation.value == 0 ? 0 : 100)),
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

  Widget _signButton(){
    return Container(
        height: 100,
        width: 100,
        child: AnimatedBuilder(
            animation: CurvedAnimation(parent: _controllerSign, curve: Curves.fastOutSlowIn),
            builder: (context, child) {
              return Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    _buildContainerAnimation(50  * _controllerSign.value),
                    _buildContainerAnimation(70  * _controllerSign.value),
                    _buildContainerAnimation(90  * _controllerSign.value),
                    _buildContainerAnimation(110 * _controllerSign.value),
                    FloatingActionButton(
                        onPressed: null,
                        child: Icon(Icons.login),
                        backgroundColor: Colors.blue,
                        elevation: 5
                    )
                  ]
              );
            }
        )
    );
  }

  Widget _buildContainerAnimation(double radius) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue.withOpacity(1 - _controllerSign.value),
      ),
    );
  }

  Widget _dragDetector(){
    return Positioned(
      left: _left,
      bottom: 100,
      child: GestureDetector(
          onHorizontalDragStart: (view){
            Offset position = Offset(view.globalPosition.dx - 20, view.globalPosition.dy);
            setState(() {
              _left = position.dx;
            });
          },
          onHorizontalDragUpdate: (view){
            Offset position = Offset(view.globalPosition.dx - 20, view.globalPosition.dy);
            setState(() {
              _left = position.dx;
            });
          },
          onHorizontalDragEnd: (view){
            setState(() {
              _left = 150;
            });
          },
          child: _signButton()
      ),
    );
  }
}