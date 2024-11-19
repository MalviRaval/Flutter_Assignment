//Write a program in android display screen color which the Color will be select from the radio button.

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:module_3/m_59_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: M59(),
    );
  }
}



class M59 extends StatefulWidget {
  const M59({super.key});

  @override
  State<M59> createState() => _M59State();
}

class _M59State extends State<M59> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: null,
      body: Column(
        children: [
          Stack(children: <Widget>[

            Opacity( //semi red clippath with more height and with 0.5 opacity
              opacity: 0.5,
              child: ClipPath(
                clipper:WaveClipper(), //set our custom wave clipper
                child:Container(
                  color:Colors.lightBlue,
                  height:200,
                ),
              ),
            ),
            ClipPath(
              clipper:WaveClipper(),
              child:Container(
                  padding: EdgeInsets.only(bottom: 50),
                  color:Colors.blue,
                  height:180,
                  alignment: Alignment.center,
                  child: Text("Create Account", style: TextStyle(
                    fontSize:22, color:Colors.white,
                  ),)
              ),
            ),



          ],),
          SizedBox(height: 30,),

          Padding(padding:EdgeInsets.only(left: 12.0,right: 12.0)
            ,child: Column(
            children: [
              TextFormField (
                keyboardType: TextInputType.name,
                decoration: InputDecoration(

                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),

                  labelText: 'Username',
                ),
              ),
              SizedBox(height: 30,),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(

                  prefixIcon: const Icon(Icons.transgender_sharp),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),

                  labelText: 'Age',
                ),
              ),
              SizedBox(height: 30,),
              Row(children: [ addRadioButton(0, 'Male'),
                SizedBox(width: 12,),
                addRadioButton(1, 'Female'),
                SizedBox(width: 12,),
                addRadioButton(2, 'Others'),],),
              SizedBox(height: 30,),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.password),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),

                  labelText: 'Password',
                ),
              ),
              SizedBox(height: 30,),
              ElevatedButton(

                onPressed: () {
                  // Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (context) => const M59LoginPage()));
                },
                child: Text('Create'),
              ),


              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => const M59LoginPage()));
                },
                child: const Text('Login'),
              )
            ],
          ),)


        ],
      )
    );
  }

   String select="Female";

  Row addRadioButton(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Colors.blue,
          value: gender[btnValue],
          groupValue: select,
          onChanged: (value){
            setState(() {
              print(value);
              select=value;
            });
          },
        ),
        Text(title,style: TextStyle(fontSize: 14),)
      ],
    );
  }

}



List gender=["Male","Female","Other"];

//Costom CLipper class with Path
class WaveClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {

    var path = new Path();
    path.lineTo(0, size.height); //start path with this if you are making at bottom

    var firstStart = Offset(size.width / 5, size.height);
    //fist point of quadratic bezier curve
    var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
    //second point of quadratic bezier curve
    path.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart = Offset(size.width - (size.width / 3.24), size.height - 105);
    //third point of quadratic bezier curve
    var secondEnd = Offset(size.width, size.height - 10);
    //fourth point of quadratic bezier curve
    path.quadraticBezierTo(secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    path.lineTo(size.width, 0); //end with this path if you are making wave at bottom
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; //if new instance have different instance than old instance
    //then you must return true;
  }
}

