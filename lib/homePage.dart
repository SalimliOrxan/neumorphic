import 'dart:ui';

import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HomePage extends StatefulWidget {

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF8F8F8),
        appBar: AppBar(
            backgroundColor: Color(0xFFF8F8F8),
            elevation: 0,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: NeumorphicButton(
                    onPressed: (){

                    },
                    child: Icon(Icons.search, color: Colors.black),
                    padding: EdgeInsets.all(10),
                    style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        boxShape: NeumorphicBoxShape.circle()
                    )
                )
              )
            ],
          flexibleSpace: Align(
              alignment: Alignment.bottomLeft,
              child: _story()
          )
        ),
        bottomNavigationBar: _navBar(),
        body: SafeArea(
          child: ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
              itemBuilder: (context, position) => _item()
          )
        )
    );
  }

  Widget _item(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Neumorphic(
        padding: EdgeInsets.all(8),
        style: NeumorphicStyle(
            shape: NeumorphicShape.concave,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
            depth: 9,
            lightSource: LightSource.topLeft,
            color: Color(0xFFEFEFEF),
            surfaceIntensity: 0
        ),
        child: Container(
            height: 72,
            width: double.infinity,
            child: Row(
                children: [
                  CircleAvatar(
                      backgroundImage: NetworkImage('https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock-.jpg'),
                      maxRadius: 40
                  ),
                  Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Adam Smith',
                              style: TextStyle(fontSize: 16, color: Color(0xFF3C3C59), fontWeight: FontWeight.w700),
                            ),
                            Text(
                                'Yeah, I think I know wha...',
                                style: TextStyle(fontSize: 16, color: Color(0xFF909CA1))
                            )
                          ]
                      )
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '11:45',
                          style: TextStyle(fontSize: 12, color: Color(0xFF06D81E)),
                        ),
                        CircleAvatar(
                            child: Text(
                                '3',
                                style: TextStyle(fontSize: 12, color: Colors.white)
                            ),
                            backgroundColor: Color(0xFF06D81E),
                            maxRadius: 15
                        )
                      ]
                  )
                ]
            )
        ),
      ),
    );
  }

  Widget _navBar(){
    return CustomNavigationBar(
        onTap: (index){
          setState(() {
            this.index = index;
          });
        },
        currentIndex: index,
        selectedColor: Color(0xFF06D81E),
        unSelectedColor: Color(0xFF3C3C59),
        elevation: 0,
        backgroundColor: Colors.transparent,
        items: [
          CustomNavigationBarItem(
              icon: Icon(Icons.camera_alt),
              title: Text('PHOTO', style: TextStyle(color: Color(0xFF3C3C59), fontSize: 10))
          ),
          CustomNavigationBarItem(
              icon: Icon(Icons.call),
              title: Text('CALLS', style: TextStyle(color: Color(0xFF3C3C59), fontSize: 10))),
          CustomNavigationBarItem(
              icon: Icon(Icons.chat),
              title: Text('CHATS', style: TextStyle(color: Color(0xFF3C3C59), fontSize: 10))),
          CustomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('CONTACTS', style: TextStyle(color: Color(0xFF3C3C59), fontSize: 10))),
          CustomNavigationBarItem(
              icon: Icon(Icons.more_vert),
              title: Text('MORE', style: TextStyle(color: Color(0xFF3C3C59), fontSize: 10)))
        ]
    );
  }

  Widget _story(){
    return Row(
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 16),
            child: NeumorphicButton(
                onPressed: (){

                },
                child: Icon(Icons.add, color: Colors.black),
                padding: EdgeInsets.all(15),
                style: NeumorphicStyle(
                    shape: NeumorphicShape.concave,
                    boxShape: NeumorphicBoxShape.circle()
                )
            )
        ),
        Padding(
            padding: const EdgeInsets.only(left: 16),
            child: NeumorphicButton(
                onPressed: (){

                },
                child: CircleAvatar(
                    maxRadius: 15,
                    backgroundColor: Colors.blue,
                    child: CircleAvatar(
                        maxRadius: 14,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                            maxRadius: 12,
                            backgroundImage: NetworkImage('https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock-.jpg')
                        )
                    )
                ),
                padding: EdgeInsets.all(15),
                style: NeumorphicStyle(
                    shape: NeumorphicShape.concave,
                    boxShape: NeumorphicBoxShape.circle()
                )
            )
        ),
        Padding(
            padding: const EdgeInsets.only(left: 16),
            child: NeumorphicButton(
                onPressed: (){

                },
                child: CircleAvatar(
                    maxRadius: 15,
                    backgroundColor: Colors.blue,
                    child: CircleAvatar(
                        maxRadius: 14,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                            maxRadius: 12,
                            backgroundImage: NetworkImage('https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock-.jpg')
                        )
                    )
                ),
                padding: EdgeInsets.all(15),
                style: NeumorphicStyle(
                    shape: NeumorphicShape.concave,
                    boxShape: NeumorphicBoxShape.circle()
                )
            )
        ),
        Padding(
            padding: const EdgeInsets.only(left: 16),
            child: NeumorphicButton(
                onPressed: (){

                },
                child: CircleAvatar(
                    maxRadius: 15,
                    backgroundColor: Colors.blue,
                    child: CircleAvatar(
                        maxRadius: 14,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                            maxRadius: 12,
                            backgroundImage: NetworkImage('https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock-.jpg')
                        )
                    )
                ),
                padding: EdgeInsets.all(15),
                style: NeumorphicStyle(
                    shape: NeumorphicShape.concave,
                    boxShape: NeumorphicBoxShape.circle()
                )
            )
        ),
        Padding(
            padding: const EdgeInsets.only(left: 16),
            child: NeumorphicButton(
                onPressed: (){

                },
                child: CircleAvatar(
                    maxRadius: 15,
                    backgroundColor: Colors.blue,
                    child: CircleAvatar(
                        maxRadius: 14,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                            maxRadius: 12,
                            backgroundImage: NetworkImage('https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock-.jpg')
                        )
                    )
                ),
                padding: EdgeInsets.all(15),
                style: NeumorphicStyle(
                    shape: NeumorphicShape.concave,
                    boxShape: NeumorphicBoxShape.circle()
                )
            )
        ),
      ]
    );
  }
}