// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

// void main() {
//   runApp( MyApp());
// }

// class MyApp extends StatelessWidget {
//    MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: M61(),
//     );
//   }
// }

class M61 extends StatefulWidget {
  M61({Key? key, required this.map}) : super(key: key);
  final Map map;

  @override
  State<M61> createState() => _M61State();
}

class _M61State extends State<M61> {
  List<Map<String, String>> ingredientList = [
    {'imageName': 'assets/images/ingredient.jpeg', 'ingredientName': 'Noodles'},
    {'imageName': 'assets/images/ingredient1.jpeg', 'ingredientName': 'Shrimp'},
    {'imageName': 'assets/images/ingredient.jpeg', 'ingredientName': 'Egg'},
    {
      'imageName': 'assets/images/ingredient1.jpeg',
      'ingredientName': 'Scallion'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              // Yellow background
              Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                color: Colors.yellow,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: const Icon(
                            Icons.arrow_back_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: const Icon(
                            Icons.favorite_border,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // White rounded container
              Positioned(
                top: MediaQuery.of(context).size.height * 0.25,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.75,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 70),
                              // Space for overlapping dish image
                              // Food Name
                              Text(
                                widget.map['foodName'] ?? '',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 5),
                              // Icons Row
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  iconText(Icons.watch_later_outlined,
                                      Colors.blueAccent, '50min'),
                                  const SizedBox(width: 20),
                                  iconText(Icons.star, Colors.yellow, '4.5'),
                                  const SizedBox(width: 20),
                                  iconText(Icons.fireplace_rounded, Colors.red,
                                      '325 kcal'),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Ingredients',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 100,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  padding: const EdgeInsets.all(8),
                                  itemCount: ingredientList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      width: 120,
                                      margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.grey.shade300),
                                      ),
                                      child: Center(
                                        child: Text(
                                          ingredientList[index]['ingredientName'] ??
                                              '',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Dish Image
              Positioned(
                top: MediaQuery.of(context).size.height * 0.2 - 50,
                left: MediaQuery.of(context).size.width * 0.5 - 90, // Center image
                child: Container(
                  padding: const EdgeInsets.all(5), // Yellow border thickness
                  decoration: const BoxDecoration(
                    color: Colors.yellow,
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/dish.jpg',
                      width: 160,
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}

iconText(
  IconData iconName,
  Color colorName,
  String name,
) {
  return Row(
    children: [
      Icon(
        iconName,
        size: 20,
        color: colorName,
      ),
      Text(
        name,
        style: TextStyle(color: Colors.black54),
      )
    ],
  );
}
