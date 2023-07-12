import 'package:dummy_project/constant.dart';
import 'package:flutter/material.dart';


void showSaleCategory(BuildContext context) {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    context: context,
    elevation: 10,
    isScrollControlled: true,
    builder: (BuildContext context) {
      //this StatefulBuilder is to solve the problem of setState need to
      //reopen the modalsheet and then can see the changes
      return StatefulBuilder(
          //the StateSetter  is the main thing that to re render the UI
          //with changing the value ***setModalState is a variable can be change
          builder: (BuildContext context, StateSetter setModalState) {
        return Container(
          padding: EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
            //this for prevent soft keyboard covering the text field
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Container(
            padding: EdgeInsets.all(10),
            // child: Text('texts'),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Sale Category',
                    style: TextStyle(fontSize: 19),
                  ),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: saleCategory.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(saleCategory[index]['title']),
                      // trailing: ElevatedButton(
                      //   onPressed: () {},
                      //   style: ElevatedButton.styleFrom(
                      //     // padding: EdgeInsets.all(15),
                      //     primary: saleCategory[index]['isSelected']
                      //         ? Colors.green
                      //         : Colors.orange,
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(12),
                      //     ),
                      //   ),
                      //   child: saleCategory[index]['isSelected']
                      //       ? Text('Selected')
                      //       : Text('Select'),
                      // ),
                      trailing: saleCategory[index]['isSelected']
                          ? ElevatedButton.icon(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                // padding: EdgeInsets.all(15),
                                primary: Colors.green,

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              label: Text('Selected'),
                              icon: Icon(
                                Icons.check_box_sharp,
                                color: Colors.greenAccent[200],
                              ),
                            )
                          : ElevatedButton(
                              onPressed: () {
                                setModalState(() {
                                  saleCategory[index]['isSelected'] =
                                      !saleCategory[index]['isSelected'];
                                  for (var i = 0;
                                      i < saleCategory.length;
                                      i++) {
                                    if (i != index) {
                                      saleCategory[i]['isSelected'] = false;
                                    }
                                  }
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                // padding: EdgeInsets.all(15),
                                primary: saleCategory[index]['isSelected']
                                    ? Colors.green
                                    : Colors.orange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: saleCategory[index]['isSelected']
                                  ? Text('Selected')
                                  : Text('Select'),
                            ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      thickness: 0.3,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      });
    },
  );
}

void showSelectTender(BuildContext context) {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    context: context,
    elevation: 10,
    isScrollControlled: true,
    builder: (BuildContext context) {
      //this StatefulBuilder is to solve the problem of setState need to
      //reopen the modalsheet and then can see the changes
      return StatefulBuilder(
          //the StateSetter  is the main thing that to re render the UI
          //with changing the value ***setModalState is a variable can be change
          builder: (BuildContext context, StateSetter setModalState) {
        return Container(
          padding: EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
            //this for prevent soft keyboard covering the text field
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Container(
            padding: EdgeInsets.all(10),
            // child: Text('texts'),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Select Tender',
                    style: TextStyle(fontSize: 19),
                  ),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: tenderList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(tenderList[index]['title']),
                      // trailing: ElevatedButton(
                      //   onPressed: () {},
                      //   style: ElevatedButton.styleFrom(
                      //     // padding: EdgeInsets.all(15),
                      //     primary: saleCategory[index]['isSelected']
                      //         ? Colors.green
                      //         : Colors.orange,
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(12),
                      //     ),
                      //   ),
                      //   child: saleCategory[index]['isSelected']
                      //       ? Text('Selected')
                      //       : Text('Select'),
                      // ),
                      // trailing: ElevatedButton(
                      //   onPressed: () {
                      //     setState(() {
                      //       tenderList[index]['isSelected'] = !tenderList[index]['isSelected'];
                      //     });
                      //   },
                      //   child: Text('Select'),
                      //   style: ElevatedButton.styleFrom(
                      //     primary: tenderList[index]['isSelected']
                      //         ? Colors.orange
                      //         : Colors.green,
                      //   ),
                      // ),

                      trailing: tenderList[index]['isSelected']
                          ? ElevatedButton.icon(
                              onPressed: () {
                                print('true button to false');
                              },
                              style: ElevatedButton.styleFrom(
                                // padding: EdgeInsets.all(15),
                                primary: Colors.green,
                                // primary: tenderList[index]['isSelected']
                                //     ? Colors.green
                                //     : Colors.orange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              label: Text('Selected'),
                              icon: Icon(
                                Icons.check_box_sharp,
                                color: Colors.greenAccent[200],
                              ),
                            )
                          : ElevatedButton(
                              onPressed: () {
                                print('false button to true');

                                setModalState(() {
                                  tenderList[index]['isSelected'] =
                                      !tenderList[index]['isSelected'];
                                  for (var i = 0; i < tenderList.length; i++) {
                                    if (i != index) {
                                      tenderList[i]['isSelected'] = false;
                                    }
                                  }
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                // padding: EdgeInsets.all(15),
                                primary: tenderList[index]['isSelected']
                                    ? Colors.green
                                    : Colors.orange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              // child: tenderList[index]['isSelected']
                              //     ? Text('Selected')
                              //     : Text('Select'),
                              child: Text('Select'),
                            ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      thickness: 0.3,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      });
    },
  );
}
