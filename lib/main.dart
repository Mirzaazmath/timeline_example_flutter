import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'TimeLineCard.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title:  Center( child:Text("sample "),),
          backgroundColor: Colors.deepPurpleAccent[100],
        ),
        body: Center(
          child: TimeLine(),
        ),
      ),
    );
  }
}
class TimeLine extends StatefulWidget {
  const TimeLine({Key? key}) : super(key: key);

  @override
  _TimeLineState createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  late List<TimeLineCard> timeline;

  @override
  void initState() {
    super.initState();
    timeline =_getcards();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: timeline.length,
          itemBuilder: (context,index){
        return Container(
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                    width: 2,
                    height: 50,
                    color:index==0? Colors.white: Colors.black,

                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5,right: 5),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(Icons.check,color: Colors.white,),
                  ),
                  Container(
                    width: 2,
                    height: 50,
                    color:index==timeline.length-1? Colors.white: Colors.black,

                  ),
                ],
              ),
              Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(top: BorderSide(width: 4,color: Colors.blueAccent)),
                      boxShadow:[ BoxShadow(
                        blurRadius:10,
            color: Colors.black26,
                      )]
                    ),
                    height: 100,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(timeline[index].title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            Text(timeline[index].descripton,style: TextStyle(fontSize: 16,),),

                          ],
                        ),
                    ),
                  )),

            ],
          ),
        );
      }),
    );
  }
  List<TimeLineCard>_getcards(){
    List<TimeLineCard>timelineCard =[];
    timelineCard.add(TimeLineCard("OrderPlaced", "The order is placed please wait .." ));
    timelineCard.add(TimeLineCard("Packing", "packing has stared " ));
    timelineCard.add(TimeLineCard("Out for delivery", "the order is now out for delivery" ));
    timelineCard.add(TimeLineCard("On The Way", "The order is now on the way to reach you" ));
    timelineCard.add(TimeLineCard("Delivered", "The order is delivered" ));
return timelineCard;
  }
}

