import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/homePage.dart';
import 'package:flutter_app/singPage.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class A extends StatefulWidget {

  @override
  _AState createState() => _AState();
}

class _AState extends State<A> with TickerProviderStateMixin {

  AnimationController c;

  @override
  void initState() {
    super.initState();
    c = AnimationController(duration: Duration(milliseconds: 200), vsync: this);
  }

  @override
  void dispose() {
    c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedBuilder(
            animation: c,
            builder: (context, child){
              return Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Transform(
                        transform: Matrix4(
                            1,0,0,0,
                            0,1,0,0,
                            0,0,1,0.02,
                            0,-200*c.value,0,1
                        )..rotateX(c.value <= 0.02 ? c.value : 0.02),
                        alignment: FractionalOffset.topCenter,
                        child: getView()
                    ),
                    Transform.translate(
                        offset: Offset(0, c.value == 0 ? 300 : 300 - c.value * 1.2 * 300),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                          child: FractionallySizedBox(
                            heightFactor: 0.3,
                            widthFactor: 0.7,
                            child: Container(
                                decoration: _background(),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      NeumorphicButton(
                                          onPressed: c.reverse,
                                          child: Text('Cancel', style: TextStyle(color: Colors.black)),
                                          padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
                                          style: NeumorphicStyle(
                                              shape: NeumorphicShape.concave,
                                              depth: 9,
                                              surfaceIntensity: 0,
                                              color: Color(0xFFF5EFEF)
                                          )
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.only(top: 10),
                                          child: NeumorphicButton(
                                              onPressed: () => Navigator.of(context).pushReplacement(_createRoute()),
                                              child: Text('Logout', style: TextStyle(color: Colors.black)),
                                              padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
                                              style: NeumorphicStyle(
                                                  shape: NeumorphicShape.concave,
                                                  depth: 9,
                                                  surfaceIntensity: 0,
                                                  color: Color(0xFFF5EFEF)
                                              )
                                          )
                                      )
                                    ]
                                )
                            ),
                          ),
                        )
                    )
                  ]
              );
            }
        )
    );
  }

  Widget getView(){
    return InkWell(
        onTap: () => c.forward(),
        child: HomePage()
    );
  }

  BoxDecoration _background(){
    return BoxDecoration(
        borderRadius: BorderRadius.circular(30),
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

  Route _createRoute() {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => SignPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(0, -1);
          var end = Offset.zero;
          var tween = Tween(begin: begin, end: end);
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
              position: offsetAnimation,
              child: child
          );
        }
    );
  }
}
