import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool expansionChange = true;
  List<Map> menuList = [
    {
      'title': 'Steam',
      'subtitle': [
        {'name': 'fish', 'isAdded': false, 'count': 0},
        {'name': 'bowl', 'isAdded': false, 'count': 0},
        {'name': 'beat', 'isAdded': false, 'count': 0},
        {'name': 'pork', 'isAdded': false, 'count': 0}
      ]
    },
    {
      'title': 'Steam Nasi',
      'subtitle': [
        {'name': 'fish', 'isAdded': false, 'count': 0},
        {'name': 'bowl', 'isAdded': false, 'count': 0},
        {'name': 'beat', 'isAdded': false, 'count': 0},
        {'name': 'pork', 'isAdded': false, 'count': 0}
      ]
    },
    {
      'title': 'Bakmie',
      'subtitle': [
        {'name': 'fish', 'isAdded': false, 'count': 0},
        {'name': 'bowl', 'isAdded': false, 'count': 0},
        {'name': 'beat', 'isAdded': false, 'count': 0},
        {'name': 'pork', 'isAdded': false, 'count': 0}
      ]
    },
    {
      'title': 'Ayam',
      'subtitle': [
        {'name': 'fish', 'isAdded': false, 'count': 0},
        {'name': 'bowl', 'isAdded': false, 'count': 0},
        {'name': 'beat', 'isAdded': false, 'count': 0},
        {'name': 'pork', 'isAdded': false, 'count': 0}
      ]
    },
    {
      'title': 'Ayam',
      'subtitle': [
        {'name': 'fish', 'isAdded': false, 'count': 0},
        {'name': 'bowl', 'isAdded': false, 'count': 0},
        {'name': 'beat', 'isAdded': false, 'count': 0},
        {'name': 'pork', 'isAdded': false, 'count': 0}
      ]
    },
    {
      'title': 'Ayam',
      'subtitle': [
        {'name': 'fish', 'isAdded': false, 'count': 0},
        {'name': 'bowl', 'isAdded': false, 'count': 0},
        {'name': 'beat', 'isAdded': false, 'count': 0},
        {'name': 'pork', 'isAdded': false, 'count': 0}
      ]
    },
    {
      'title': 'Ayam',
      'subtitle': [
        {'name': 'fish', 'isAdded': false, 'count': 0},
        {'name': 'bowl', 'isAdded': false, 'count': 0},
        {'name': 'beat', 'isAdded': false, 'count': 0},
        {'name': 'pork', 'isAdded': false, 'count': 0}
      ]
    },
    {
      'title': 'Ayam',
      'subtitle': [
        {'name': 'fish', 'isAdded': false, 'count': 0},
        {'name': 'bowl', 'isAdded': false, 'count': 0},
        {'name': 'beat', 'isAdded': false, 'count': 0},
        {'name': 'pork', 'isAdded': false, 'count': 0}
      ]
    },
    {
      'title': 'Ayam',
      'subtitle': [
        {'name': 'fish', 'isAdded': false, 'count': 0},
        {'name': 'bowl', 'isAdded': false, 'count': 0},
        {'name': 'beat', 'isAdded': false, 'count': 0},
        {'name': 'pork', 'isAdded': false, 'count': 0}
      ]
    },
  ];
  BorderRadiusGeometry radius = const BorderRadius.only(
    topLeft: Radius.circular(24.0),
    topRight: Radius.circular(24.0),
  );
  PanelController slidingUpController = new PanelController();
  ExpansionTileController ExpansionController = ExpansionTileController();
  @override
  Widget build(BuildContext context) {
    print(menuList[0]['subtitle'][0]);
    print(menuList[1]['subtitle'][0]);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          titleSpacing: 0,
          automaticallyImplyLeading: false,
          title: RichText(
            textAlign: TextAlign.start,
            text: const TextSpan(
                text: "Reg 1",
                style: TextStyle(fontSize: 15, color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                    text: '\nTable 1',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ]),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.black,
              )),
          actions: const [
            Center(
              child: Text('A0000011111',
                  style: TextStyle(color: Colors.black, fontSize: 15)),
            ),
          ],
        ),
        bottomNavigationBar: Container(
            // color: Colors.grey,
            // width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height / 2,
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Container(
            //    decoration: BoxDecoration(
            //     color: Colors.blueGrey,
            //     borderRadius: radius,
            //   ),
            //   child :ExpansionTile(
            //     title: Text('asads'),
            //     trailing: Icon(expansionChange
            //         ? Icons.arrow_circle_down
            //         : Icons.arrow_circle_up),
            //     onExpansionChanged: (bool expanded) {
            //       setState(() {
            //         expansionChange = expanded;
            //       });
            //     },
            //     children: [
            //       Container(
            //         height: 340,
            //         child: ListView.builder(
            //           itemCount: menuList.length,
            //           itemBuilder: (context, index) {
            //             return ListTile(
            //               title: Text(menuList[index]['title']),
            //             );
            //           },
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Container(
              padding: EdgeInsets.only(right: 18),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: radius,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.menu_book,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                  const Text(
                    'All Menu',
                    style: TextStyle(color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        useRootNavigator: true,
                        context: context,
                        elevation: 3,
                        // isScrollControlled: true,

                        builder: (BuildContext context) {
                          return Container(
                            // padding: EdgeInsets.only(
                            //   top: 15,
                            //   left: 15,
                            //   right: 15,
                            //   //this for prevent soft keyboard covering the text field
                            //   bottom: MediaQuery.of(context).viewInsets.bottom +
                            //       150,
                            // ),
                            child: Container(
                              padding: EdgeInsets.all(10),

                              // child: Text('texts'),
                              child: const Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 20),
                                    child: Text('More Action',
                                        style: TextStyle(fontSize: 19)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Text('data'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Text('data'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Text('data'),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_upward,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(width: 0.5, color: Colors.black12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: const TextSpan(
                        text: '0 Iteasdasdm',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                        children: <TextSpan>[
                          TextSpan(
                            text: '\nasjasdasdasasasddjjjj',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          )
                        ]),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(15),
                          primary: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          )),
                      onPressed: () {},
                      child: const Text(
                        'Detail',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ))
                ],
              ),
            ),
          ],
        )
            // child: Container(
            //   padding: EdgeInsets.all(8),
            //   decoration: BoxDecoration(
            //     border: Border.all(width: 0.5, color: Colors.black12),
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       RichText(
            //         text: const TextSpan(
            //             text: '0 Iteasdasdm',
            //             style: TextStyle(color: Colors.black, fontSize: 18),
            //             children: <TextSpan>[
            //               TextSpan(
            //                 text: '\nasjasdasdasasasddjjjj',
            //                 style: TextStyle(color: Colors.black, fontSize: 18),
            //               )
            //             ]),
            //       ),
            //       ElevatedButton(
            //           style: ElevatedButton.styleFrom(
            //               padding: EdgeInsets.all(15),
            //               primary: Colors.orange,
            //               shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(12),
            //               )),
            //           onPressed: () {},
            //           child: const Text(
            //             'Detail',
            //             style: TextStyle(
            //               color: Colors.white,
            //               fontSize: 20,
            //             ),
            //           ))
            //     ],
            //   ),
            // ),
            ),

        body: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Search',
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: menuList.length,
                  itemBuilder: (context, index1) {
                    return ExpansionTile(
                      title: Text(menuList[index1]['title']),
                      children: [
                        ListView.separated(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: menuList[index1]['subtitle'].length,
                            itemBuilder: ((context, index2) {
                              return ListTile(
                                title: Text(menuList[index1]['subtitle'][index2]
                                    ['name']),
                                subtitle: const Text('@83'),

                                trailing: menuList[index1]['subtitle'][index2]
                                        ['isAdded']
                                    ? Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          IconButton(
                                            icon: Icon(Icons.remove),
                                            onPressed: () {
                                              setState(() {
                                                if (menuList[index1]['subtitle']
                                                        [index2]['count'] >
                                                    0) {
                                                  menuList[index1]['subtitle']
                                                      [index2]['count']--;
                                                }
                                              });
                                            },
                                            color: Colors.red,
                                          ),
                                          Text(menuList[index1]['subtitle']
                                                  [index2]['count']
                                              .toString()),
                                          IconButton(
                                            icon: Icon(Icons.add),
                                            color: Colors.green,
                                            onPressed: () {
                                              setState(() {
                                                menuList[index1]['subtitle']
                                                    [index2]['count']++;
                                              });
                                            },
                                          ),
                                        ],
                                      )
                                    : ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.orange,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            menuList[index1]['subtitle']
                                                    [index2]['isAdded']=true;
                                          });
                                        },
                                        child: const Text('Add to Cart'),
                                      ),

                                // trailing: ElevatedButton(
                                //   style: ElevatedButton.styleFrom(
                                //     primary: Colors.orange,
                                //     shape: RoundedRectangleBorder(
                                //       borderRadius: BorderRadius.circular(8),
                                //     ),
                                //   ),
                                //   onPressed: () {

                                //   },
                                //   child: const Text('Add to Cart'),
                                // ),
                              );
                            }),
                            separatorBuilder: (context, index) {
                              return const Divider(
                                thickness: 0.3,
                              );
                            }),
                      ],
                    );
                  },
                ),
              )

              // child: ExpansionTile(
              //   title: Text('asads'),
              //   trailing: Icon(expansionChange
              //       ? Icons.arrow_circle_down
              //       : Icons.arrow_circle_up),
              //   onExpansionChanged: (bool expanded) {
              //     setState(() {
              //       expansionChange = expanded;
              //     });
              //   },
              //   children: [
              //     Container(
              //       height: 340,
              //       child: ListView.builder(
              //         itemCount: menuList.length,
              //         itemBuilder: (context, index) {
              //           return ListTile(
              //             title: Text(menuList[index]['title']),
              //           );
              //         },
              //       ),
              //     ),
              //   ],
              // ),

              // child: Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: <Widget>[
              //     IconButton(
              //       onPressed: () {},
              //       icon: const Icon(
              //         Icons.menu_book,
              //         color: Colors.white,
              //         size: 16,
              //       ),
              //     ),
              //     const Text(
              //       'All Menu',
              //       style: TextStyle(color: Colors.white),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),

        // body: SlidingUpPanel(
        //   controller: slidingUpController,
        //   minHeight: 42,
        //   color: Colors.blueGrey,
        //   panel: Text('welcome to panel'),
        //   collapsed: Container(
        //     padding: EdgeInsets.only( right: 18),
        //     decoration: BoxDecoration(
        //       color: Colors.blueGrey,
        //       borderRadius: radius,
        //     ),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: <Widget>[
        //         IconButton(
        //           onPressed: () {},
        //           icon: const Icon(
        //             Icons.menu_book,
        //             color: Colors.white,
        //             size: 16,
        //           ),
        //         ),
        //         const Text(
        //           'All Menu',
        //           style: TextStyle(color: Colors.white),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
