import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_p_eco/pages/mainModel.dart';
import 'package:flutter_p_eco/pages/mainScreen.dart';

class MainScreen extends StatefulWidget {
  
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


          final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Color.fromARGB(255, 247, 247, 247),
  primary:  Color(0xffE56B6F),
  minimumSize: Size(70,60),
  padding: EdgeInsets.symmetric(horizontal: 85),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  ),
);


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

     backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child:
                   Column(
                    children: [
                        Image.asset(
                        contents[i].image,
                        width: 550,
                        height: 550,
                      ),
                      Text(

                        contents[i].title,
                        style: TextStyle(
                      color: Color(0xffE56B6F),
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 50),
                    
                      Text(
                        contents[i].description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 166, 165, 165),
                        ),
                      ),
SizedBox(height: 50),
  ElevatedButton(
  style: raisedButtonStyle,
  onPressed: () {
                if (currentIndex == contents.length - 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => HomeScreen(),
                    ),
                  );
                }
                _controller.nextPage(
                  duration: Duration(milliseconds: 100),
                  curve: Curves.bounceIn,
                );
              }, 
  child: Text('Get Started ', style:  TextStyle(
                          fontSize: 18,),),
                ),
                    ],
                  ),  
                );
              }
            ),
          ),
        ],
           
      ),
    );
  }
}
