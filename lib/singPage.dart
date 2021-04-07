import 'package:flutter/cupertino.dart';
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
  
  final _providerPositionY = StateProvider.autoDispose<double>((_) => 100.0);
  AnimationController _controllerAnimation, _controllerRipple, _controllerRippleDrag;
  bool _isLoginPressed = true;

  @override
  Widget build(BuildContext context) {
    _controllerAnimation  = useAnimationController(duration: Duration(milliseconds: 400));
    _controllerRippleDrag = useAnimationController(duration: Duration(milliseconds: 400));
    _controllerRipple     = useAnimationController(duration: Duration(milliseconds: 1200), lowerBound: 0.5)..repeat();

    final _paddingBottomSignButton = useProvider(_providerPositionY).state;
    final isLoading                = useProvider(providerLoading).state;

    return Scaffold(
        body: LayoutBuilder(
            builder: (context, constraints){
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
                              child: Container(decoration: _background(constraints.maxWidth))
                          );
                        }
                    ),
                    AnimatedBuilder(
                      animation: _controllerAnimation,
                      builder: (context, _) => FractionallySizedBox(
                        heightFactor: _controllerAnimation.value == 0 ? 0.6 : (1 - _controllerAnimation.value / 6) * 0.6,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 200),
                          child: Transform.translate(
                                offset: Offset(0, _controllerAnimation.value * -(_isLoginPressed ? height * 0.1 : height * 0.16)),
                                child: SvgPicture.asset('resources/images/logo.svg')
                          )
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
                                        IgnorePointer(
                                          ignoring: isLoading,
                                          child: NeumorphicButton(
                                              onPressed: () async {
                                                await _controllerAnimation.reverse();
                                                _isLoginPressed = true;
                                                _controllerRipple.repeat();
                                                _controllerRippleDrag.reverse();
                                              },
                                              child: Icon(Icons.close, size: 25, color: isLoading ? Colors.grey : Colors.black),
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
                    _dragDetector(height, _paddingBottomSignButton)
                  ]
              );
            }
        )
    );
  }

  BoxDecoration _background(double width){
    return BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(width, _controllerAnimation.value == 0 ? 0 : 100)),
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
    return AnimatedBuilder(
        animation: _controllerRippleDrag,
        builder: (context, _) => Container(
          height: (1 - _controllerRippleDrag.value) * 100,
          width: (1 - _controllerRippleDrag.value) * 100,
          child: AnimatedBuilder(
              animation: CurvedAnimation(parent: _controllerRipple, curve: Curves.fastOutSlowIn),
              builder: (context, child) {
                return Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      _buildContainerAnimation(50  * _controllerRipple.value),
                      _buildContainerAnimation(70  * _controllerRipple.value),
                      _buildContainerAnimation(90  * _controllerRipple.value),
                      _buildContainerAnimation(110 * _controllerRipple.value),
                      NeumorphicButton(
                          child: Icon(Icons.drag_indicator, color: Color(0xFF654ea3)),
                          style: NeumorphicStyle(
                              shape: NeumorphicShape.convex,
                              depth: 9,
                              boxShape: NeumorphicBoxShape.circle(),
                          )
                      )
                    ]
                );
              }
          )
      )
    );
  }

  Widget _buildContainerAnimation(double radius) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(1 - _controllerRipple.value)
      )
    );
  }

  Widget _dragDetector(double height, double paddingBottom){
    final sizeActiveArea = 10;
    final endLimit       = 210;
    final radiusIcon     = 50;

    return Positioned(
      left: 0,
      right: 0,
      bottom: paddingBottom,
      child: GestureDetector(
          child: _signButton(),
          onVerticalDragStart: (view){
            final positionCenter = view.globalPosition.dy + radiusIcon;
            context.read(_providerPositionY).state = height - positionCenter;
          },
          onVerticalDragUpdate: (view){
            _controllerRipple.stop();
            final positionCenter = view.globalPosition.dy + radiusIcon;
            if(height - positionCenter <= endLimit && positionCenter <= height)
              context.read(_providerPositionY).state = height - positionCenter;
          },
          onVerticalDragEnd: (view) async {
            if(paddingBottom >= endLimit - sizeActiveArea){
              _isLoginPressed = true;
              _controllerRippleDrag.forward();
              await _controllerAnimation.forward();
              _controllerRipple.stop();
            }
            else if(paddingBottom <= sizeActiveArea){
              _isLoginPressed = false;
              _controllerRippleDrag.forward();
              await _controllerAnimation.forward();
              _controllerRipple.stop();
            }
            else _controllerRipple.repeat();

            context.read(_providerPositionY).state = 100.0;
          }
      )
    );
  }
}