import 'package:flutter/material.dart';

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
      home: const M492(),
    );
  }
}





//Create below screens




class M492 extends StatefulWidget {
  const M492({super.key});

  @override
  State<M492> createState() => _M492State();
}

class _M492State extends State<M492> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    'assets/images/mountain.jpg',
                    height: 260,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color.fromRGBO(224,227,232, 1.0),
                            border:  Border.all(
                              width: 1,
                              color: Colors.blueAccent,
                              style: BorderStyle.solid,
                            ),
                          ),

                          child: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.black,
                              size: 22
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color.fromRGBO(224,227,232, 1.0),
                            border:  Border.all(
                              width: 1,
                              color: Colors.blueAccent,
                              style: BorderStyle.solid,
                            ),
                          ),

                          child: const Icon(
                              Icons.favorite_rounded,
                              color: Colors.black,
                              size: 22
                          ),
                        ),
                      ],
                    ),
                  ),

                ],

              ),
              const SizedBox(height: 16,),
              const Padding(
                padding: EdgeInsets.only(left: 16.0,right: 16.0),
                child: Text('Men\'s winter jacket',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
              ),
              const SizedBox(height: 8,),
              const Padding(
                padding: EdgeInsets.only(left: 16.0,right: 16.0),
                child: Text('\$148',style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold,fontSize: 16),),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0,right: 16.0),
                child: Text('Navigating the winter season often presents a fashion conundrum, where the need for warmth challenges one’s style quotient',style: TextStyle(fontSize: 12,color: Colors.black45),),
              ),
              const Padding(
                  padding: EdgeInsets.only(left: 16.0,right: 16.0,top: 16.0,bottom: 0.0),
                  child:  Text("Reviews",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),)),

              Padding(
                padding: const EdgeInsets.only(left: 16.0,right: 16.0),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 2,

                    padding: const EdgeInsets.only(top: 8.0,bottom: 16.0),
                    itemBuilder: (BuildContext context, int index) {
                      return const Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.black,
                                  backgroundImage: AssetImage(
                                    'assets/images/men.jpg',
                                  ),
                                ),
                                SizedBox(width: 8,),
                                Flexible(
                                    child: Text(
                                      'Sooraj S Nair',
                                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,),
                                    )),
                              ],
                            ),
                            SizedBox(height: 8,),
                            Text(
                              "c.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 16,),
                          ]
                      );
                    }),
              )
            ],
          )),
    );
  }
}

