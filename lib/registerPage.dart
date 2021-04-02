import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class RegisterPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
              children: [
                Neumorphic(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: TextField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            hintText: 'Name',
                            border: InputBorder.none
                        )
                    ),
                    style: NeumorphicStyle(
                        depth: -5,
                        surfaceIntensity: 0,
                        color: Colors.white
                    )
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Neumorphic(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: TextField(
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              hintText: 'Surname',
                              border: InputBorder.none
                          )
                      ),
                      style: NeumorphicStyle(
                          depth: -5,
                          surfaceIntensity: 0,
                          color: Colors.white
                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Neumorphic(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: TextField(
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: 'Email',
                              border: InputBorder.none
                          )
                      ),
                      style: NeumorphicStyle(
                          depth: -5,
                          surfaceIntensity: 0,
                          color: Colors.white
                      )
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Neumorphic(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: TextField(
                            textInputAction: TextInputAction.send,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: 'Password',
                                border: InputBorder.none
                            )
                        ),
                        style: NeumorphicStyle(
                            depth: -5,
                            surfaceIntensity: 0,
                            color: Colors.white
                        )
                    )
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 30),
                    child: Neumorphic(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: TextField(
                            textInputAction: TextInputAction.send,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: 'Password again',
                                border: InputBorder.none
                            )
                        ),
                        style: NeumorphicStyle(
                            depth: -5,
                            surfaceIntensity: 0,
                            color: Colors.white
                        )
                    )
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: NeumorphicButton(
                      onPressed: (){

                      },
                      child: Center(child: Text('Register', style: TextStyle(color: Colors.black))),
                      padding: EdgeInsets.all(10),
                      style: NeumorphicStyle(
                          shape: NeumorphicShape.concave,
                          depth: 11,
                          surfaceIntensity: 0,
                          color: Color(0xFFF5EFEF)
                      )
                  ),
                )
              ]
          ),
        )
    );
  }
}