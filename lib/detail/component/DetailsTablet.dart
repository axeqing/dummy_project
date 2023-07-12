// import 'package:dummy_project/detail/component/editqtyDialog.dart';
import 'package:dummy_project/detail/component/showlist.dart';
import 'package:dummy_project/main/component/functionlist.dart';
import 'package:flutter/material.dart';
import 'package:dummy_project/constant.dart';
import 'package:page_transition/page_transition.dart';

import '../../database/detailDb.dart';

class DetailsTablet extends StatefulWidget {
  const DetailsTablet({super.key});

  @override
  State<DetailsTablet> createState() => _DetailsTabletState();
}

class _DetailsTabletState extends State<DetailsTablet> {
  List<Map<String, dynamic>> _dataItem = [];
  bool cartIsempty = true;

  //refresh data
  void _refreshData() async {
    final data = await SQLHelper.getItems();
    bool _isloading = true;

    setState(() {
      _dataItem = data;
      _isloading = false;
      print(['...number of items in refresh ${_dataItem.length}']);
      print(['...number of items ${_dataItem}']);
      if (_dataItem.isNotEmpty) {
        cartIsempty = false;
      }
    });
  }

  //initialize
  @override
  void initState() {
    super.initState();
    _refreshData();
    print(['...number of items in initstae${_dataItem.length}']);
    print(['...number of items ${_dataItem}']);
  }

  //add item
  Future<void> _addItem(String title, String subtitle, int price, int quantity,
     ) async {
    // await SQLHelper.createItem(title, subtitle, price, quantity, food_Item_key);
    await SQLHelper.createItem(title, subtitle, price, quantity);
    // String title , String subtitle ,int price ,int quantity);
    _refreshData();
    print(['...number of items ${_dataItem.length}']);
    print(['...number of items ${_dataItem}']);
  }

  //edit item
  Future<void> _updateItem(
    int id,
    String title,
    String subtitle,
    int price,
    int quantity,
    
  ) async {
    await SQLHelper.updateItem(
        // id, title, subtitle, price, quantity, food_Item_key);
        id, title, subtitle, price, quantity);
    _refreshData();
  }

  //delete item
  Future<void> _deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    _refreshData();
  }

  String returnTotal(List _dataItem) {
    int totalAmount = 0;
    for (int i = 0; i < _dataItem.length; i++) {
      totalAmount =
          (_dataItem[i]['price'] * _dataItem[i]['quantity']) + totalAmount;
    }
    return totalAmount.toString();
  }

  //edit qty dialog
  void showEditQtyDialog(BuildContext context, String title, String subtitle,
      int price, bool isUpdate, int? id, int? index, int food_Item_key) {
    // String quantity;
    // String title ;
    // String subtitle ;
    // String price;
    int quantity = 0;
    if (index != null) {
      quantity = _dataItem[index]['quantity'];
    }

    showDialog(
      context: context,
      builder: ((context) {
        return StatefulBuilder(builder: (context, StateSetter setState) {
          return Dialog(
            child: Container(
              width: 200,
              // height: 410,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(501)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Edit QTY',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Card(
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(5.0),
                    // ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.4,
                            maxHeight: MediaQuery.of(context).size.width * 0.28,
                          ),
                          // child: Image.asset('',
                          //     fit: BoxFit.fill),
                          child: Image(
                            image: AssetImage('images/download.png'),
                            width: 60,
                            height: 60,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text(title), Text(subtitle)],
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    setState(() {
                                      // if (menuList[0]['subtitle'][0]['count'] >
                                      //     0) {
                                      //   menuList[0]['subtitle'][0]['count']--;
                                      // }
                                      if (quantity > 0) {
                                        quantity--;
                                      }
                                    });
                                  },
                                  color: Colors.red,
                                ),
                                // Text(menuList[0]['subtitle'][0]['count']
                                //     .toString()),
                                Text(quantity.toString()),
                                // if (index != null) ...[
                                //   Text(_dataItem[index]['quantity'].toString()),
                                // ] else ...[
                                //   Text(quantity.toString())
                                // ],

                                IconButton(
                                  icon: Icon(Icons.add),
                                  color: Colors.green,
                                  onPressed: () {
                                    setState(() {
                                      // menuList[0]['subtitle'][0]['count']++;
                                      quantity++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.grey[400]),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        '1',
                                        style: TextStyle(color: Colors.black),
                                      )),
                                )),
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        '2',
                                        style: TextStyle(color: Colors.black),
                                      )),
                                )),
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        '3',
                                        style: TextStyle(color: Colors.black),
                                      )),
                                )),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        '4',
                                        style: TextStyle(color: Colors.black),
                                      )),
                                )),
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        '5',
                                        style: TextStyle(color: Colors.black),
                                      )),
                                )),
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        '6',
                                        style: TextStyle(color: Colors.black),
                                      )),
                                )),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        '7',
                                        style: TextStyle(color: Colors.black),
                                      )),
                                )),
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        '8',
                                        style: TextStyle(color: Colors.black),
                                      )),
                                )),
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        '9',
                                        style: TextStyle(color: Colors.black),
                                      )),
                                )),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.grey[500],
                                      ),
                                      onPressed: () {},
                                      child:
                                          const Icon(Icons.remove_moderator)),
                                )),
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        '0',
                                        style: TextStyle(color: Colors.black),
                                      )),
                                )),
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.grey[500],
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        'Go',
                                        style: TextStyle(color: Colors.blue),
                                      )),
                                )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.orange[500],
                                padding: EdgeInsets.only(top: 15, bottom: 15),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () async {
                              cartIsempty = false;
                              if (id != null) {
                                if (quantity != 0) {
                                  await _updateItem(id, title, subtitle, price,
                                      quantity);
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text("Successfully changes"),
                                  ));
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text("Quantity cannot be zero!"),
                                  ));
                                }
                              } else {
                                if (quantity != 0) {
                                  await _addItem(title, subtitle, price,
                                      quantity);
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text("Successfully changes"),
                                  ));
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text("Quantity cannot be zero!"),
                                  ));
                                }
                              }
                            },
                            child: Text('Save Change'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
      }),
    );
  }

  bool isUpdate = false;
  String _selectedVal = submenuCount[0];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leadingWidth: 30,
                titleSpacing: 0,
                automaticallyImplyLeading: false,
                title: const Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3.0),
                      child: Text(
                        'Table: 1',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3.0),
                      child: Text(
                        'Cover: 1',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3.0),
                      child: Text(
                        'Mode: Reg',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3.0),
                      child: Text(
                        'Rcp: A123145566',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
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
                      size: 20,
                      color: Colors.black,
                    )),
                // leading: IconButton(
                //     onPressed: () {
                //       Navigator.pop(context);
                //     },
                //     icon: const Icon(
                //       Icons.close,
                //       size: 20,
                //       color: Colors.black,
                //     )),
              ),
              bottomNavigationBar: Container(
                  child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red[500],
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {},
                        child: Text('Void'),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue[500],
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {},
                        child: Text('Hold'),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.orange[500],
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {},
                        child: Text('Finalise'),
                      ),
                    ),
                  ),
                ],
              )),
              body: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Text(
                          'Order',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: ListTile(
                        // visualDensity: VisualDensity(vertical: -2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                        tileColor: Colors.grey[300],
                        title: const Text(
                          'Sale Category',
                          style: TextStyle(fontSize: 14),
                        ),
                        subtitle: const Text(
                          'Dine In',
                          style: TextStyle(fontSize: 18),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            showSaleCategory(context);
                          },
                          icon: Icon(Icons.edit),
                          color: Colors.cyan[300],
                        ),
                      ),
                    ),
                    Expanded(
                      child: cartIsempty
                          ? Container(
                              alignment: Alignment.center,
                              child: Text('Cart is empty'))
                          : ListView.separated(
                              // shrinkWrap: true,
                              itemCount: _dataItem.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  // title: Text(paymentList[index]['title']),
                                  title: Text(
                                      '(${_dataItem[index]['quantity']}) ' +
                                          _dataItem[index]['subtitle']),
                                  subtitle: Text('IDR ' +
                                      _dataItem[index]['price'].toString()),
                                  leading: IconButton(
                                    onPressed: () {
                                      _deleteItem(_dataItem[index]['id']);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content: Text(
                                            'Successfully deleted a item!'),
                                      ));
                                      if (_dataItem.isEmpty) {
                                        setState(() {
                                          cartIsempty = true;
                                        });
                                      }
                                    },
                                    icon: Icon(Icons.delete),
                                    color: Colors.red[300],
                                  ),
                                  trailing: IconButton(
                                    onPressed: () {
                                      //for update
                                      showEditQtyDialog(
                                        context,
                                        _dataItem[index]['title'],
                                        _dataItem[index]['subtitle'],
                                        _dataItem[index]['price'],
                                        isUpdate = true,
                                        _dataItem[index]['id'],
                                        index,
                                        _dataItem[index]['food_item_key'],
                                      );
                                    },
                                    icon: Icon(Icons.edit),
                                    color: Colors.lightBlue[300],
                                  ),
                                  // title: Row(
                                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //   children: [
                                  //     IconButton(
                                  //       onPressed: () {},
                                  //       icon: Icon(Icons.delete),
                                  //       color: Colors.red[300],
                                  //     ),
                                  //     Text('(3)'),
                                  //     Text(paymentList[index]['title']),
                                  //     Text('IDR ' +
                                  //         paymentList[index]['price'].toString()),
                                  //     IconButton(
                                  //       onPressed: () {},
                                  //       icon: Icon(Icons.edit),
                                  //       color: Colors.lightBlue[300],
                                  //     ),

                                  //   ],
                                  // ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const Divider(
                                  thickness: 0.3,
                                );
                              },
                            ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(10),
                      // margin: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Payment Summary'),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Sub Total'),
                              ),
                              // Text('IDR 60000'),
                              Text(returnTotal(_dataItem)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Discount'),
                              ),
                              Text('IDR 0'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Grand Total'),
                              ),
                              // Text('IDR 60000'),
                              Text(returnTotal(_dataItem)),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Scaffold(
              appBar:
                  AppBar(backgroundColor: Colors.white, elevation: 0, actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red[200],
                        // padding: EdgeInsets.only(top: 15, bottom: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Close',
                      style: TextStyle(color: Colors.redAccent),
                    ),
                  ),
                ),
              ]),
              body: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              // child: ListTile(
                              //   tileColor: Colors.red[400],
                              //   title: const Text(
                              //     'All',
                              //     style: TextStyle(color: Colors.white),
                              //   ),
                              //   shape: const RoundedRectangleBorder(
                              //     side: BorderSide(color: Colors.transparent),
                              //     borderRadius: BorderRadius.only(
                              //         topLeft: Radius.circular(10),
                              //         bottomLeft: Radius.circular(10),
                              //         topRight: Radius.circular(10),
                              //         bottomRight: Radius.circular(10)),
                              //   ),
                              //   contentPadding: EdgeInsets.only(left: 18),
                              //   trailing: IconButton(
                              //     splashRadius: 35,
                              //     onPressed: () {},
                              //     icon: Icon(
                              //       Icons.expand_more,
                              //       color: Colors.white,
                              //     ),
                              //   ),
                              // ),
                              child: Container(
                                // color: Colors.red[400],
                                decoration: BoxDecoration(
                                  color: Colors.red[400],
                                  border: Border.all(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: EdgeInsets.all(5),
                                child: DropdownButtonFormField(
                                  value: _selectedVal,
                                  // decoration: const InputDecoration(
                                  //     // fillColor: Colors.red,
                                  //     border: OutlineInputBorder(
                                  //         borderRadius: BorderRadius.all(Radius.circular(10)))),
                                  items: submenuCount
                                      .map((e) => DropdownMenuItem(
                                            child: Text(e),
                                            value: e,
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedVal = value as String;
                                    });
                                  },
                                ),
                              )),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Empty',
                                suffixIcon: Icon(Icons.search),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(color: Colors.grey),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: menuList.length,
                          itemBuilder: (context, index1) {
                            return ExpansionTile(
                              // shape: Border.all(color: Colors.transparent),
                              title: Text(menuList[index1]['title']),
                              children: [
                                GridView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          childAspectRatio: 1.6),
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      menuList[index1]['subtitle'].length,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      margin: EdgeInsets.all(10),
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            12, 12, 12, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 5.0),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(menuList[index1]
                                                        ['subtitle'][index]
                                                    ['name']),
                                              ),
                                            ),
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 15.0),
                                              child: Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: Text('@83'),
                                              ),
                                            ),
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    // padding: EdgeInsets.all(15),
                                                    primary: Colors.orange,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    )),
                                                onPressed: () {
                                                  //for create
                                                  showEditQtyDialog(
                                                      context,
                                                      menuList[index1]['title'],
                                                      menuList[index1]
                                                              ['subtitle']
                                                          [index]['name'],
                                                      menuList[index1]
                                                              ['subtitle']
                                                          [index]['price'],
                                                      isUpdate,
                                                      // menuList[index1]['id']
                                                      null,
                                                      null,
                                                      _dataItem[index]['id']);
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  alignment: Alignment.center,
                                                  child: const Text(
                                                    'Add to Cart',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
