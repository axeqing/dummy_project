import 'package:dummy_project/Details.dart';
// import 'package:expandable_bottom_bar/expandable_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:dummy_project/functionlist.dart';
import 'package:dummy_project/mainpageBottomSheet.dart';
import 'package:dummy_project/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Colors.transparent,
      ),
      title: 'Dummy Project',
      home: MainPageView2(),
      // debugShowCheckedModeBanner: false,
      // home: Scaffold(
      //   appBar: AppBar(
      //     backgroundColor: Colors.white,
      //     elevation: 0,
      //     title: const Text(
      //       'Function',
      //       style: TextStyle(color: Colors.black),
      //     ),
      //     actions: [IconButton(onPressed: null, icon: Icon(Icons.close))],
      //   ),
      //   body: Functionlist(),
      // ),
    );
  }
}

class MainPageView2 extends StatefulWidget {
  const MainPageView2({super.key});

  @override
  State<MainPageView2> createState() => _MainPageView2State();
}

class _MainPageView2State extends State<MainPageView2> {
  @override
  Widget build(BuildContext context) {
    List<int> numberList = <int>[
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      13,
      14,
      15,
      16,
      17,
      18,
      19,
      20,
      21,
      22,
      23,
      24,
      25,
      26,
      27,
      28,
      29,
      30
    ];

    bool isCheck = false;
    void showMoreBottomSheet(BuildContext context) {
      showModalBottomSheet(
        context: context,
        elevation: 3,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.only(
              top: 15,
              left: 15,
              right: 15,
              //this for prevent soft keyboard covering the text field
              bottom: MediaQuery.of(context).viewInsets.bottom + 150,
            ),
            child: Container(
              padding: EdgeInsets.all(10),
              // child: Text('texts'),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text('More Action', style: TextStyle(fontSize: 19)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: CheckboxListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: Colors.orange)),
                      title: Text('Tgusssss'),
                      value: isCheck,
                      onChanged: (newValue) {
                        setState(() {
                          isCheck = newValue!;
                        });
                      },
                      activeColor: Colors.white,
                      checkColor: Colors.orange,
                      controlAffinity: ListTileControlAffinity.leading,
                      tileColor: isCheck ? Colors.orange : Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: CheckboxListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: Colors.orange)),
                      title: Text('Tgusssss'),
                      value: isCheck,
                      onChanged: (value) {
                        setState(() {
                          isCheck = value!;
                        });
                      },
                      activeColor: Colors.white,
                      checkColor: Colors.orange,
                      controlAffinity: ListTileControlAffinity.leading,
                      tileColor: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: CheckboxListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: Colors.orange)),
                      title: Text('Tgusssss'),
                      value: isCheck,
                      onChanged: (newValue) {
                        setState(() {
                          isCheck = newValue!;
                        });
                      },
                      activeColor: Colors.white,
                      checkColor: Colors.orange,
                      controlAffinity: ListTileControlAffinity.leading,
                      tileColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

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
                  constraints: BoxConstraints(),
                  icon: const Icon(
                    Icons.expand_more,
                    color: Colors.black,
                  )),
            ],
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Functiolist(),
                ));
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              )),
          actions: [
            IconButton(
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                onPressed: () {
                  showInfoBottomSheet(context);
                },
                icon: const Icon(
                  Icons.info,
                  color: Colors.black,
                )),
            Padding(
              padding: const EdgeInsets.all(1),
              child: IconButton(
                  onPressed: () {
                    showMoreBottomSheet(context);
                  },
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.black,
                  )),
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(18),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, childAspectRatio: 4 / 5),
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
                        Navigator.of(context).push(MaterialPageRoute(
                          // builder: (context) => DefaultBottomBarController(
                          //   child: PageOf(),
                          // ),
                          builder: (context) => Details(),
                        ));
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
    );
  }
}
