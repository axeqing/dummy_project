// import 'package:dummy_project/detail/Details.dart';
// import 'package:dummy_project/detail/DetailsTablet.dart';
import 'package:dummy_project/detail/component/DetailsTablet.dart';
import 'package:dummy_project/detail/detailscreen.dart';
import 'package:dummy_project/main/component/functionlist.dart';
import 'package:dummy_project/main/component/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:dummy_project/constant.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:page_transition/page_transition.dart';

class MainPageViewTablet extends StatefulWidget {
  const MainPageViewTablet({super.key});

  @override
  State<MainPageViewTablet> createState() => _MainPageViewTabletState();
}

class _MainPageViewTabletState extends State<MainPageViewTablet> {
  bool status1 = false;
  bool status2 = false;
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          titleSpacing: 0,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Table Layout ',
                style: TextStyle(color: Colors.black),
              ),
              // Icon(Icons.expand_more,color: Colors.black,),
              IconButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(
                    Icons.expand_more,
                    color: Colors.black,
                  )),
            ],
          ),
          leading: IconButton(
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => const Functiolist(),
                // ));
                Navigator.push(
                    context,
                    PageTransition(
                        child: Functiolist(),
                        type: PageTransitionType.rightToLeft,
                        duration: Duration(milliseconds: 400)));
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              )),
          actions: [
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    // padding: EdgeInsets.all(15),
                    primary: Colors.orange,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  label: const Text('Open'),
                  icon: const Icon(
                    Icons.check_box_sharp,
                    color: Colors.white,
                  ),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8),
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  // padding: EdgeInsets.all(15),
                  primary: Colors.white,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                label: const Text(
                  'View',
                  style: TextStyle(color: Colors.black),
                ),
                icon: SizedBox(
                  width: 20,
                  child: Checkbox(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    onChanged: (bool? value) {},
                    value: false,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8),
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  // padding: EdgeInsets.all(15),
                  primary: Colors.white,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                label: const Text(
                  'Print',
                  style: TextStyle(color: Colors.black),
                ),
                icon: SizedBox(
                  width: 20,
                  child: Checkbox(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    onChanged: (bool? value) {},
                    value: false,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8),
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  // padding: EdgeInsets.all(15),
                  primary: Colors.white,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                label: const Text(
                  'Clean',
                  style: TextStyle(color: Colors.black),
                ),
                icon: SizedBox(
                  width: 20,
                  child: Checkbox(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    onChanged: (bool? value) {},
                    value: false,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    // padding: EdgeInsets.all(15),
                    primary: Color.fromARGB(255, 238, 207, 163),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
                onPressed: () {},
                child: const Text(
                  'Refresh',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    // padding: EdgeInsets.all(15),
                    primary: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
                onPressed: () {},
                child: const Text(
                  'OP/Sign out',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    // padding: EdgeInsets.all(15),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.orange),
                      borderRadius: BorderRadius.circular(12),
                    )),
                onPressed: () {},
                child: const Text(
                  'Hide',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical:18,horizontal:18 ),
          //  padding: const EdgeInsets.all(18 ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(100)
                            //more than 50% of width makes circle
                            ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:10.0,right: 15),
                        child: Text('Available'),
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(100)
                            //more than 50% of width makes circle
                            ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:10.0,right: 15),
                        child: Text('Reserved'),
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(100)
                            //more than 50% of width makes circle
                            ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:10.0,right: 15),
                        child: Text('Open'),
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(100)
                            //more than 50% of width makes circle
                            ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:10.0,right: 15),
                        child: Text('Hold'),
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(100)
                            //more than 50% of width makes circle
                            ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:10.0,right: 15),
                        child: Text('No Order'),
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(100)
                            //more than 50% of width makes circle
                            ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:10.0,right: 15),
                        child: Text('On cleaning'),
                      ),
                      // Container(
                      //   width: 30,
                      //   height: 30,
                      //   decoration: BoxDecoration(
                      //       color: Colors.purple,
                      //       borderRadius: BorderRadius.circular(100)
                      //       //more than 50% of width makes circle
                      //       ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal:8.0),
                      //   child: Text('Finalizing'),
                      // ),
                      // Container(
                      //   width: 30,
                      //   height: 30,
                      //   decoration: BoxDecoration(
                      //       color: Colors.blueAccent,
                      //       borderRadius: BorderRadius.circular(100)
                      //       //more than 50% of width makes circle
                      //       ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal:8.0),
                      //   child: Text('Shift Warning'),
                      // ),
                    ],
                  ),
                  //flutter_switch function
                  Row(
                    children: [
                      Row(
                        children: <Widget>[
                          Text('View Table'),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 7.0),
                            child: FlutterSwitch(
                              value: status1,
                              width: 55.0,
                              height: 25.0,
                              toggleSize: 18.0,
                              onToggle: (val) {
                                setState(() {
                                  status1 = val;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('View Detail'),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 7.0),
                            child: FlutterSwitch(
                              width: 55.0,
                              height: 25.0,
                              toggleSize: 18.0,
                              value: status2,
                              onToggle: (val) {
                                setState(() {
                                  status2 = val;
                                });
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, childAspectRatio: 2.5),
                    scrollDirection: Axis.vertical,
                    itemCount: numberList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: <Widget>[
                            FloatingActionButton(
                              heroTag: 'btn$index',
                              onPressed: () {
                                //animation page transition
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child: detailScreen(),
                                        childCurrent: MainPageView2(),
                                        type:
                                            PageTransitionType.rightToLeftJoined,
                                        duration: Duration(seconds: 1)));
                              },
                              backgroundColor: Colors.green,
                              child: Text(numberList[index].toString(),
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 20)),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
