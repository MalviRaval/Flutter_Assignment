import 'package:flutter/material.dart';
class M51B extends StatefulWidget {
  const M51B({super.key});

  @override
  State<M51B> createState() => _M51BState();
}

class _M51BState extends State<M51B> {
   late int startRange;

   late int endRange;

  @override
  Widget build(BuildContext context) {
     var map=ModalRoute.of(context)!.settings.arguments as Map;

    startRange=int.parse(map['startRange']);
    endRange=int.parse(map['endRange']);

    List mapData=[];


     for(int i=startRange;i<=endRange;){
       mapData.add(i);
       i++;
    }

    return Scaffold(
      appBar: AppBar(),
      body: Container(
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Text('$mapData'),
       ),
      ),
    );
  }
}
