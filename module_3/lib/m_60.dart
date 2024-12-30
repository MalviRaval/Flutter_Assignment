// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:module_3/utils/circle_tab_indicator.dart';
import 'package:module_3/utils/m_61.dart';

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
      home: M60(),
    );
  }
}

class M60 extends StatefulWidget {
  const M60({super.key});

  @override
  State<M60> createState() => _M60State();
}

class _M60State extends State<M60> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  // List<Widget> _list=<Widget>[
  //   FirstScreen(),
  //   FirstScreen(),
  //   FirstScreen(),
  //   FirstScreen(),
  //
  // ];

  List<Map<String, String>> map = [
    {'foodName': 'Soba Soup', 'subName': 'No1 in Sale', 'rupees': '\$12'},
    {'foodName': 'Sai Ua Samun Phrai', 'subName': 'No1 in Sale', 'rupees': '\$13'},
    {'foodName': 'Soba Soup', 'subName': 'No1 in Sale', 'rupees': '\$12'}
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white70,
        appBar: null,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amberAccent,
        onPressed: () {
// Add your onPressed code here!
    },
    child: Icon(Icons.shop,color: Colors.black,)),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: Icon(Icons.arrow_back),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: Icon(Icons.search),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0,0.0,16.0,0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Restaurant',
                              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                                        color: Colors.white30),
                                    padding: EdgeInsets.fromLTRB(4.0, 8.0, 4.0, 4.0),
                                    child: Text('20-30 min',
                                        style: TextStyle(fontSize: 12, color: Colors.white))),
                                SizedBox(width: 10,),
                                Text('2.4 km',
                                    style: TextStyle(fontSize: 12, color: Colors.black26)),
                                SizedBox(width: 10,),
                                Text('Restaurant',
                                    style: TextStyle(fontSize: 12, color: Colors.black26)),
                              ],
                            ),
                          ],
                        ),
                        Image.asset('assets/images/dish.jpg',width: 80,height: 80,)

                      ],),
                    Text('Orange sandwiches is delicious',
                        style: TextStyle(fontSize: 14, color: Colors.black)),

                  ],
                ),
              ),

              TabBar(
                //labelPadding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                labelPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                dividerColor: Colors.transparent,
                controller: _tabController,
                indicatorWeight: 0,
                padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 20.0),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    22.0,
                  ),
                  color: Colors.amber,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(
                    text: 'Recommended',
                  ),
                  Tab(
                    text: 'Popular',
                  ),
                  Tab(
                    text: 'Noodles',
                  ),
                  Tab(
                    text: 'Pizza',
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // ListView.builder(
                    //   itemCount: map.length,
                    //   itemBuilder: (context, index) {
                    //     return Card(
                    //       child: ListTile(
                    //         minLeadingWidth:40,
                    //         leading: CircleAvatar(
                    //                                  radius: 50, // You can adjust this size based on your preference
                    //                                 backgroundImage: AssetImage('assets/images/dish.jpg'),
                    //                              ), // Placeholder for image or icon
                    //         title: Text(map[index]['foodName'] ?? ''),
                    //         subtitle: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             Text(map[index]['subName'] ?? ''),
                    //             Text(map[index]['rupees'] ?? ''),
                    //           ],
                    //         ),
                    //         trailing: Icon(Icons.arrow_forward_ios),
                    //       ),
                    //     );
                    //   },
                    // ),
                    SingleChildScrollView (
                        child: ListView.builder(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: map.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: (){
//                                 Navigator.push(context, MaterialPageRoute(builder:  (context) =>
// M61(map: map[index])
//                                 ));
                              },
                              child: Card(
                                  margin: EdgeInsets.all(2.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center, // Centers vertically in the row
                                          mainAxisAlignment: MainAxisAlignment.start,     // Aligns items to the left horizontally
                                          children: [
                                            // CircleAvatar for the image
                                            CircleAvatar(
                                              radius: 50, // You can adjust this size based on your preference
                                              backgroundImage: AssetImage('assets/images/dish.jpg'),
                                            ),
                                            SizedBox(width: 20), // Adds spacing between the CircleAvatar and the Text column

                                            // Flexible widget to allow the text column to take available space
                                            Flexible(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start, // Aligns the text to the left
                                                    children: [
                                                      Text(
                                                        map[index]['foodName'] ?? '',
                                                        overflow: TextOverflow.ellipsis,
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: Colors.black,
                                                            fontWeight: FontWeight.bold
                                                        ),
                                                      ),
                                                      Text(
                                                        map[index]['subName'] ?? '',
                                                        overflow: TextOverflow.ellipsis,
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.amberAccent,
                                                            fontWeight: FontWeight.bold
                                                        ),
                                                      ),
                                                      Text(
                                                        map[index]['rupees'] ?? '',
                                                        overflow: TextOverflow.ellipsis,
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.black,
                                                            fontWeight: FontWeight.bold
                                                        ),
                                                      ),
                                                    ],
                                                  ),


                                                  Icon(
                                                    Icons.arrow_forward_ios,
                                                    size: 18, // Adjust the icon size
                                                    color: Colors.black, // Adjust icon color as needed
                                                  ),
                                                ],),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )),
                            );

                          },)
                    ),
                   // Other Tabs Content
                    Center(
                      child: Text(
                        'Popular',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Popular',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Noodles',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Pizza',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}
//
// class FirstScreen extends StatefulWidget {
//   const FirstScreen({super.key});
//
//   @override
//   State<FirstScreen> createState() => _FirstScreenState();
// }
//
// class _FirstScreenState extends State<FirstScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
