import 'package:flutter/material.dart';
List<Map>moreCheckBtn =[
  {'title':'Open','isChecked':false},
  {'title':'View','isChecked':false},
  {'title':'Print','isChecked':false},
  {'title':'Clean','isChecked':false},
];

// void showMoreBottomSheet(BuildContext context) {
//       bool isCheck = false;
//       showModalBottomSheet(
//         context: context,
//         elevation: 3,
//         isScrollControlled: true,
//         builder: (BuildContext context) {
//           return Container(
//             padding: EdgeInsets.only(
//               top: 15,
//               left: 15,
//               right: 15,
//               //this for prevent soft keyboard covering the text field
//               bottom: MediaQuery.of(context).viewInsets.bottom + 150,
//             ),
//             child: Container(
//               padding: EdgeInsets.all(10),
//               // child: Text('texts'),
//               child:   Column( 
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                     const Padding(
//                     padding: EdgeInsets.only(bottom: 20),
//                     child: Text('More Action', style: TextStyle(fontSize: 19)),
//                   ),
//                   ListView.builder(
//                     itemCount:moreCheckBtn.length , 
//                     itemBuilder: (context,index){
//                     return CheckboxListTile(value: moreCheckBtn[index]['isChecked'], 
//                     onChanged: (value){
//                       setState
//                     })

//                   },)
   
                  
                  // Padding(
                  //   padding: const EdgeInsets.only(bottom: 10),
                  //   child: CheckboxListTile(
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(20),
                  //         side: BorderSide(color: Colors.orange)),
                  //     title: Text('Tgusssss'),
                  //     value: isCheck,
                  //     onChanged: (newValue) {
                  //       setState(() {
                  //         isCheck = newValue!;
                  //       });
                  //     },
                  //     activeColor: Colors.white,
                  //     checkColor: Colors.orange,
                  //     controlAffinity: ListTileControlAffinity.leading,
                  //     tileColor: Colors.white,
                  //   ),
                  // ),
//                   // Padding(
//                   //   padding: const EdgeInsets.only(bottom: 10),
//                   //   child: CheckboxListTile(
//                   //     shape: RoundedRectangleBorder(
//                   //         borderRadius: BorderRadius.circular(20),
//                   //         side: BorderSide(color: Colors.orange)),
//                   //     title: Text('Tgusssss'),
//                   //     value: isCheck,
//                   //     onChanged: (newValue) {
//                   //       setState(() {
//                   //         isCheck = newValue!;
//                   //       });
//                   //     },
//                   //     activeColor: Colors.white,
//                   //     checkColor: Colors.orange,
//                   //     controlAffinity: ListTileControlAffinity.leading,
//                   //     tileColor: Colors.white,
//                   //   ),
//                   // ),
//                   // Padding(
//                   //   padding: const EdgeInsets.only(bottom: 10),
//                   //   child: CheckboxListTile(
//                   //     shape: RoundedRectangleBorder(
//                   //         borderRadius: BorderRadius.circular(20),
//                   //         side: BorderSide(color: Colors.orange)),
//                   //     title: Text('Tgusssss'),
//                   //     value: isCheck,
//                   //     onChanged: (newValue) {
//                   //       setState(() {
//                   //         isCheck = newValue!;
//                   //       });
//                   //     },
//                   //     activeColor: Colors.white,
//                   //     checkColor: Colors.orange,
//                   //     controlAffinity: ListTileControlAffinity.leading,
//                   //     tileColor: Colors.white,
//                   //   ),
//                   // ),
//                 ],
//               ),
//             ),
//           );
//         },
//       );
//     }

    List ColorData = [
      Colors.tealAccent,
      Colors.amber,
      Colors.black,
      Colors.blue,
      Colors.cyan,
      Colors.deepPurple,
      Colors.pink,
      Colors.red
    ];

    List ColorInformation = [
      'Available',
      'Reserved',
      'Open',
      'Hold',
      'No Order',
      'On Cleaning',
      'Finalizing',
      'Shift Warning'
    ];

    void showInfoBottomSheet(BuildContext context) {
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
              bottom: MediaQuery.of(context).viewInsets.bottom + 15,
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
                    child: Text(
                      'Table information',
                      style: TextStyle(fontSize: 19),
                    ),
                  ),
                  GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4, childAspectRatio: 1),
                      itemCount: ColorData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 1),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Column(
                                children: [
                                  FloatingActionButton(
                                    heroTag: 'btn$index',
                                    onPressed: () {},
                                    backgroundColor: ColorData.elementAt(index),
                                    // child: Text(numberList[index].toString(),
                                    //     style: const TextStyle(
                                    //         color: Colors.black, fontSize: 20)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                        ColorInformation[index].toString()),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      })
                ],
              ),
            ),
          );
        },
      );
    }
