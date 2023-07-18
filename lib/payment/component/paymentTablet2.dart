// import 'package:dummy_project/database/detailDb.dart';
// import 'package:dummy_project/detail/component/showlist.dart';
// import 'package:dummy_project/main/component/functionlist.dart';
// import 'package:flutter/material.dart';
// import 'package:page_transition/page_transition.dart';

// class PaymentTablet extends StatefulWidget {
//   const PaymentTablet({super.key});

//   @override
//   State<PaymentTablet> createState() => _PaymentTabletState();
// }

// class _PaymentTabletState extends State<PaymentTablet> {
//   List<Map<String, dynamic>> _dataItem = [];
//   bool cartIsempty = true;
//   bool isUpdate = false;

//   //refresh data
//   void _refreshData() async {
//     final data = await SQLHelper.getItems();
//     bool _isloading = true;

//     setState(() {
//       _dataItem = data;
//       _isloading = false;
//       print(['...number of items in refresh ${_dataItem.length}']);
//       print(['...number of items ${_dataItem}']);
//       if (_dataItem.isNotEmpty) {
//         cartIsempty = false;
//       }
//     });
//   }

//   //initialize
//   @override
//   void initState() {
//     super.initState();
//     _refreshData();
//     print(['...number of items in initstae${_dataItem.length}']);
//     print(['...number of items ${_dataItem}']);
//   }

//   //add item
//   Future<void> _addItem(String title, String subtitle, int price, int quantity,
//       int food_item_key) async {
//     // await SQLHelper.createItem(title, subtitle, price, quantity, food_Item_key);
//     await SQLHelper.createItem(title, subtitle, price, quantity, food_item_key);
//     // String title , String subtitle ,int price ,int quantity);
//     _refreshData();
//     print(['...number of items ${_dataItem.length}']);
//     print(['...number of items ${_dataItem}']);
//   }

//   //edit item
//   Future<void> _updateItem(
//     int id,
//     String title,
//     String subtitle,
//     int price,
//     int quantity,
//     int food_item_key,
//   ) async {
//     await SQLHelper.updateItem(
//         // id, title, subtitle, price, quantity, food_Item_key);
//         id,
//         title,
//         subtitle,
//         price,
//         quantity,
//         food_item_key);
//     _refreshData();
//   }

//   //delete item
//   Future<void> _deleteItem(int id) async {
//     await SQLHelper.deleteItem(id);
//     _refreshData();
//   }

//   String returnTotal(List _dataItem) {
//     int totalAmount = 0;
//     for (int i = 0; i < _dataItem.length; i++) {
//       totalAmount =
//           (_dataItem[i]['price'] * _dataItem[i]['quantity']) + totalAmount;
//     }
//     return totalAmount.toString();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Row(
//         children: [
//           Expanded(
//             flex: 3,
//             child: Scaffold(
//               appBar: AppBar(
//                 backgroundColor: Colors.white,
//                 elevation: 0,
//                 leadingWidth: 30,
//                 titleSpacing: 0,
//                 automaticallyImplyLeading: false,
//                 title: const Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 3.0),
//                       child: Text(
//                         'Table: 1',
//                         style: TextStyle(color: Colors.black, fontSize: 16),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 3.0),
//                       child: Text(
//                         'Cover: 1',
//                         style: TextStyle(color: Colors.black, fontSize: 16),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 3.0),
//                       child: Text(
//                         'Mode: Reg',
//                         style: TextStyle(color: Colors.black, fontSize: 16),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 3.0),
//                       child: Text(
//                         'Rcp: A123145566',
//                         style: TextStyle(color: Colors.black, fontSize: 16),
//                       ),
//                     ),
//                   ],
//                 ),
//                 leading: IconButton(
//                     onPressed: () {
//                       // Navigator.of(context).push(MaterialPageRoute(
//                       //   builder: (context) => const Functiolist(),
//                       // ));
//                       Navigator.push(
//                           context,
//                           PageTransition(
//                               child: Functiolist(),
//                               type: PageTransitionType.rightToLeft,
//                               duration: Duration(milliseconds: 400)));
//                     },
//                     icon: const Icon(
//                       Icons.menu,
//                       size: 20,
//                       color: Colors.black,
//                     )),
//                 // leading: IconButton(
//                 //     onPressed: () {
//                 //       Navigator.pop(context);
//                 //     },
//                 //     icon: const Icon(
//                 //       Icons.close,
//                 //       size: 20,
//                 //       color: Colors.black,
//                 //     )),
//               ),
//               body: Container(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
//                 child: Column(
//                   children: [
//                     const Row(
//                       children: [
//                         Text(
//                           'Order',
//                           style: TextStyle(fontSize: 20),
//                         ),
//                       ],
//                     ),
//                     Container(
//                       padding: EdgeInsets.symmetric(vertical: 10),
//                       child: ListTile(
//                         visualDensity: VisualDensity(vertical: -4),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(13),
//                         ),
//                         tileColor: Colors.grey[300],
//                         title: const Text(
//                           'Sale Category',
//                           style: TextStyle(fontSize: 14),
//                         ),
//                         subtitle: const Text(
//                           'Dine In',
//                           style: TextStyle(fontSize: 18),
//                         ),
//                         trailing: IconButton(
//                           onPressed: () {
//                             showSaleCategory(context);
//                           },
//                           icon: Icon(Icons.edit),
//                           color: Colors.cyan[300],
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: cartIsempty
//                           ? Container(
//                               alignment: Alignment.center,
//                               child: Text('Cart is empty'))
//                           : ListView.separated(
//                               // shrinkWrap: true,
//                               itemCount: _dataItem.length,
//                               itemBuilder: (context, index) {
//                                 return ListTile(
//                                   // title: Text(paymentList[index]['title']),
//                                   visualDensity: VisualDensity(vertical: -4),
//                                   title: Text(
//                                       '(${_dataItem[index]['quantity']}) ' +
//                                           _dataItem[index]['subtitle']),
//                                   subtitle: Text('IDR ' +
//                                       _dataItem[index]['price'].toString()),
//                                   leading: IconButton(
//                                     onPressed: () {
//                                       _deleteItem(_dataItem[index]['id']);
//                                       ScaffoldMessenger.of(context)
//                                           .showSnackBar(const SnackBar(
//                                         content: Text(
//                                             'Successfully deleted a item!'),
//                                       ));
//                                       if (_dataItem.isEmpty) {
//                                         setState(() {
//                                           cartIsempty = true;
//                                         });
//                                       }
//                                     },
//                                     icon: Icon(Icons.delete),
//                                     color: Colors.red[300],
//                                   ),
//                                   trailing: IconButton(
//                                     onPressed: () {
//                                       //for update
//                                       // showEditQtyDialog(
//                                       //     context,
//                                       //     _dataItem[index]['title'],
//                                       //     _dataItem[index]['subtitle'],
//                                       //     _dataItem[index]['price'],
//                                       //     isUpdate = true,
//                                       //     _dataItem[index]['id'],
//                                       //     index,
//                                       //     _dataItem[index]['food_item_key']);
//                                     },
//                                     icon: Icon(Icons.edit),
//                                     color: Colors.lightBlue[300],
//                                   ),
//                                   // title: Row(
//                                   //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   //   children: [
//                                   //     IconButton(
//                                   //       onPressed: () {},
//                                   //       icon: Icon(Icons.delete),
//                                   //       color: Colors.red[300],
//                                   //     ),
//                                   //     Text('(3)'),
//                                   //     Text(paymentList[index]['title']),
//                                   //     Text('IDR ' +
//                                   //         paymentList[index]['price'].toString()),
//                                   //     IconButton(
//                                   //       onPressed: () {},
//                                   //       icon: Icon(Icons.edit),
//                                   //       color: Colors.lightBlue[300],
//                                   //     ),

//                                   //   ],
//                                   // ),
//                                 );
//                               },
//                               separatorBuilder:
//                                   (BuildContext context, int index) {
//                                 return const Divider(
//                                   thickness: 0.3,
//                                 );
//                               },
//                             ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.symmetric(vertical: 10),
//                       decoration: BoxDecoration(
//                         color: Colors.grey[400],
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       padding: EdgeInsets.all(5),
//                       // margin: EdgeInsets.all(16),
//                       child: Column(
//                         children: [
//                           Align(
//                             alignment: Alignment.centerLeft,
//                             child: Padding(
//                               padding: EdgeInsets.all(6.0),
//                               child: Text('Payment Summary'),
//                             ),
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.all(6.0),
//                                 child: Text('Sub Total'),
//                               ),
//                               // Text('IDR 60000'),
//                               Text(returnTotal(_dataItem)),
//                             ],
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.all(6.0),
//                                 child: Text('Discount'),
//                               ),
//                               Text('IDR 0'),
//                             ],
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.all(6.0),
//                                 child: Text('Grand Total'),
//                               ),
//                               // Text('IDR 60000'),
//                               Text(returnTotal(_dataItem)),
//                             ],
//                           ),
//                           TextFormField(
//                             decoration: InputDecoration(
//                                 filled: true,
//                                 fillColor: Colors.white,
//                                 hintText: 'empty',
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10))),
//                           ),
//                         ],
//                       ),
//                     ),
//                     //numpad
//                     Container(
//                       decoration: BoxDecoration(color: Colors.grey[400]),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Expanded(
//                                   child: Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 2.0),
//                                 child: ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                       primary: Colors.white,
//                                     ),
//                                     onPressed: () {},
//                                     child: const Text(
//                                       '1',
//                                       style: TextStyle(color: Colors.black),
//                                     )),
//                               )),
//                               Expanded(
//                                   child: Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 2.0),
//                                 child: ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                       primary: Colors.white,
//                                     ),
//                                     onPressed: () {},
//                                     child: const Text(
//                                       '2',
//                                       style: TextStyle(color: Colors.black),
//                                     )),
//                               )),
//                               Expanded(
//                                   child: Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 2.0),
//                                 child: ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                       primary: Colors.white,
//                                     ),
//                                     onPressed: () {},
//                                     child: const Text(
//                                       '3',
//                                       style: TextStyle(color: Colors.black),
//                                     )),
//                               )),
//                               Expanded(
//                                   child: Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 2.0),
//                                 child: ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                       primary: Colors.blue,
//                                     ),
//                                     onPressed: () {},
//                                     child: const Text(
//                                       '-',
//                                       style: TextStyle(color: Colors.black),
//                                     )),
//                               )),
//                             ],
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Expanded(
//                                   child: Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 2.0),
//                                 child: ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                       primary: Colors.white,
//                                     ),
//                                     onPressed: () {},
//                                     child: const Text(
//                                       '4',
//                                       style: TextStyle(color: Colors.black),
//                                     )),
//                               )),
//                               Expanded(
//                                   child: Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 2.0),
//                                 child: ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                       primary: Colors.white,
//                                     ),
//                                     onPressed: () {},
//                                     child: const Text(
//                                       '5',
//                                       style: TextStyle(color: Colors.black),
//                                     )),
//                               )),
//                               Expanded(
//                                   child: Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 2.0),
//                                 child: ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                       primary: Colors.white,
//                                     ),
//                                     onPressed: () {},
//                                     child: const Text(
//                                       '6',
//                                       style: TextStyle(color: Colors.black),
//                                     )),
//                               )),
//                               Expanded(
//                                   child: Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 2.0),
//                                 child: ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                       primary: Colors.blue,
//                                     ),
//                                     onPressed: () {},
//                                     child: const Text(
//                                       '_',
//                                       style: TextStyle(color: Colors.black),
//                                     )),
//                               )),
//                             ],
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Expanded(
//                                   child: Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 2.0),
//                                 child: ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                       primary: Colors.white,
//                                     ),
//                                     onPressed: () {},
//                                     child: const Text(
//                                       '7',
//                                       style: TextStyle(color: Colors.black),
//                                     )),
//                               )),
//                               Expanded(
//                                   child: Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 2.0),
//                                 child: ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                       primary: Colors.white,
//                                     ),
//                                     onPressed: () {},
//                                     child: const Text(
//                                       '8',
//                                       style: TextStyle(color: Colors.black),
//                                     )),
//                               )),
//                               Expanded(
//                                   child: Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 2.0),
//                                 child: ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                       primary: Colors.white,
//                                     ),
//                                     onPressed: () {},
//                                     child: const Text(
//                                       '9',
//                                       style: TextStyle(color: Colors.black),
//                                     )),
//                               )),
//                               Expanded(
//                                   child: Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 2.0),
//                                 child: ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                       primary: Colors.blue,
//                                     ),
//                                     onPressed: () {},
//                                     child: const Text(
//                                       '<',
//                                       style: TextStyle(color: Colors.black),
//                                     )),
//                               )),
//                             ],
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Expanded(
//                                   child: Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 2.0),
//                                 child: ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                       primary: Colors.white,
//                                     ),
//                                     onPressed: () {},
//                                     child: const Text(
//                                       ',',
//                                       style: TextStyle(color: Colors.black),
//                                     )),
//                               )),
//                               Expanded(
//                                   child: Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 2.0),
//                                 child: ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                       primary: Colors.white,
//                                     ),
//                                     onPressed: () {},
//                                     child: const Text(
//                                       '0',
//                                       style: TextStyle(color: Colors.black),
//                                     )),
//                               )),
//                               Expanded(
//                                   child: Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 2.0),
//                                 child: ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                       primary: Colors.white,
//                                     ),
//                                     onPressed: () {},
//                                     child: const Text(
//                                       '.',
//                                       style: TextStyle(color: Colors.black),
//                                     )),
//                               )),
//                               Expanded(
//                                   child: Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 2.0),
//                                 child: ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                       primary: Colors.blue,
//                                     ),
//                                     onPressed: () {},
//                                     child: const Text(
//                                       '>',
//                                       style: TextStyle(color: Colors.black),
//                                     )),
//                               )),
//                             ],
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 3,
//             child: Column(
//               children: [
//                 Text('Tender Mode')
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
