import 'package:flutter/material.dart';

class M59LoginPage extends StatefulWidget {
  const M59LoginPage({super.key});

  @override
  State<M59LoginPage> createState() => _M59LoginPageState();
}

class _M59LoginPageState extends State<M59LoginPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: null,
        body: Column(
          children: [
            Stack(children: <Widget>[

              Opacity(
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
                    child: Text("Login Account", style: TextStyle(
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
// Action to perform
                    },
                    child: Text('Login'),
                  )
                ],
              ),)


          ],
        )
    );
  }

  String select="Female";


}




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

