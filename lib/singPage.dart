import 'package:flutter/material.dart';
import 'package:flutter_app/loginPage.dart';
import 'package:flutter_app/registerPage.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignPage extends StatefulWidget {

  @override
  _SignState createState() => _SignState();
}

class _SignState extends State<SignPage> with TickerProviderStateMixin {

  AnimationController c;
  bool _isLoginPressed = true;

  @override
  void initState() {
    super.initState();
    c = AnimationController(duration: Duration(milliseconds: 400), vsync: this);
  }

  @override
  void dispose() {
    c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints){
            double height                     = constraints.maxHeight;
            double transformLengthInLogin     = height * 0.43;
            double transformLengthInRegister  = height * 0.6;
            double heightBottomPageInLogin    = height * 0.35;
            double heightBottomPageInRegister = height * 0.5;

            return Stack(
                children: [
                  AnimatedBuilder(
                      animation: c,
                      builder: (context, child){
                        return Transform.translate(
                            offset: Offset(0, c.value * -(_isLoginPressed ? transformLengthInLogin : transformLengthInRegister)),
                            child: Stack(
                                children: [
                                  Container(
                                      decoration: _background(),
                                      width: double.infinity,
                                      child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Transform.translate(
                                                offset: Offset(0, c.value * (_isLoginPressed ? height * 0.4 : height * 0.53)),
                                                child: SvgPicture.asset(
                                                    'resources/images/logo.svg',
                                                    height: c.value == 0 ? height * 0.3 : (1 - c.value / 6) * height * 0.27
                                                )
                                            ),
                                            Padding(
                                                padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
                                                child: Opacity(
                                                    opacity: 1 - c.value,
                                                    child: Transform.translate(
                                                        offset: Offset(0, c.value * (_isLoginPressed ? height * 0.3 : height * 0.4) * 2),
                                                        child: Column(
                                                            children: [
                                                              Padding(
                                                                padding: const EdgeInsets.only(bottom: 10),
                                                                child: NeumorphicButton(
                                                                    onPressed: (){
                                                                      _isLoginPressed = true;
                                                                      c.forward();
                                                                    },
                                                                    child: Center(child: Text('Login', style: TextStyle(color: Colors.black))),
                                                                    padding: EdgeInsets.all(10),
                                                                    style: NeumorphicStyle(
                                                                        shape: NeumorphicShape.concave,
                                                                        depth: 11,
                                                                        surfaceIntensity: 0,
                                                                        color: Color(0xFFF5EFEF)
                                                                    )
                                                                ),
                                                              ),
                                                              NeumorphicButton(
                                                                  onPressed: (){
                                                                    _isLoginPressed = false;
                                                                    c.forward();
                                                                  },
                                                                  child: Center(child: Text('Register', style: TextStyle(color: Colors.black))),
                                                                  padding: EdgeInsets.all(10),
                                                                  style: NeumorphicStyle(
                                                                      shape: NeumorphicShape.convex,
                                                                      depth: 11,
                                                                      surfaceIntensity: 0,
                                                                      color: Color(0xFFF5EFEF)
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
                                ]
                            )
                        );
                      }
                  ),
                  AnimatedBuilder(
                      animation: c,
                      builder: (context, child){
                        return Align(
                          alignment: Alignment.bottomCenter,
                          child: Opacity(
                            opacity: c.value,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Transform.translate(
                                offset: Offset(
                                    0,
                                    c.value == 0
                                        ? height * 0.4
                                        : _isLoginPressed
                                        ? c.value * -(transformLengthInLogin - heightBottomPageInLogin) + 20 // 20 is button radius size
                                        : c.value * -(transformLengthInRegister - heightBottomPageInRegister) + 20
                                ),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      NeumorphicButton(
                                          onPressed: () => c.reverse().then((_) => _isLoginPressed = true),
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
                                          padding: EdgeInsets.only(top: 20),
                                          child: _isLoginPressed ? LoginPage() : RegisterPage()
                                      )
                                    ]
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                  )
                ]
            );
          }
        )
    );
  }

  BoxDecoration _background(){
    return BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(MediaQuery.of(context).size.width, c.value == 0 ? 0 : 100)),
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