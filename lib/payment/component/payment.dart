import 'package:dummy_project/database/detailDb.dart';
import 'package:dummy_project/transaction/transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:dummy_project/transaction/component/transaction.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  List<Map<String, dynamic>> _dataItem = [];
  bool cartIsempty = true;
  bool isUpdate = false;

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

  // //add item
  // Future<void> _addItem(
  //     String title, String subtitle, int price, int quantity) async {
  //   await SQLHelper.createItem(title, subtitle, price, quantity);
  //   // String title , String subtitle ,int price ,int quantity);
  //   _refreshData();
  //   print(['...number of items ${_dataItem.length}']);
  //   print(['...number of items ${_dataItem}']);
  // }

  //edit item
  Future<void> _updateItem(int id, String title, String subtitle, int price,
      int quantity, int food_item_key) async {
    // await SQLHelper.updateItem(id, title, subtitle, price, quantity,food_item_key);
    await SQLHelper.updateItem(
        id, title, subtitle, price, quantity, food_item_key);
    _refreshData();
  }

  //delete item
  Future<void> _deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    _refreshData();
  }

  List<Map> saleCategory = [
    {'title': 'Dine in', 'isSelected': true},
    {'title': 'GOFOOD', 'isSelected': false},
    {'title': 'GRAB FOOD', 'isSelected': false},
    {'title': 'SHOPE FOOD', 'isSelected': false},
    {'title': 'Take Away', 'isSelected': false},
  ];

  List<Map> tenderList = [
    {'title': 'Debit BCA', 'isSelected': true},
    {'title': 'Flazz', 'isSelected': false},
    {'title': 'GOBIZ', 'isSelected': false},
    {'title': 'GOPAY', 'isSelected': false},
  ];

  //calculate total amount
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
      int price, bool isUpdate, int? id, int? index, int food_item_key) {
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
                                      quantity, food_item_key);
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

  @override
  Widget build(BuildContext context) {
    void showSaleCategory() {
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

    void showSelectTender() {
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
                                      for (var i = 0;
                                          i < tenderList.length;
                                          i++) {
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

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: -2,
        // automaticallyImplyLeading: false,
        title: const Text(
          'Detail Payment',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.black,
              ))
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(right: 10, left: 10),
        decoration: const BoxDecoration(
          color: Colors.grey,
          // borderRadius: radius,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                visualDensity: VisualDensity(vertical: -4),
                title: const Text('Debit BCA'),
                minLeadingWidth: 10,
                leading: const Icon(
                  Icons.check_box,
                  color: Colors.greenAccent,
                ),
                tileColor: Colors.green,
                trailing: IconButton(
                    onPressed: () {
                      showSelectTender();
                      print('is press');
                    },
                    icon: const Icon(
                      Icons.edit,
                    )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
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
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          alignment: Alignment.centerRight,
                          primary: Colors.orange[600],
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => transactionScreen(),
                        ));
                      },
                      child: const Column(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 12, bottom: 5),
                              child: Text(
                                'Check Out',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 12),
                              child: Text('IDR asd300000'),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.only(right: 15, left: 15, bottom: 13),
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: const TextSpan(
                        text: "Reg 1",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: '\nTable 1',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ]),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 15, left: 15),
                  child: const Text(
                    'A0000001111',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(right: 18, left: 18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
              ),
              child: ListTile(
                visualDensity: VisualDensity(vertical: -2),
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
                    showSaleCategory();
                  },
                  icon: Icon(Icons.edit),
                  color: Colors.cyan[300],
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                // shrinkWrap: true,
                itemCount: _dataItem.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('(${_dataItem[index]['quantity']}) ' +
                        _dataItem[index]['subtitle']),
                    subtitle:
                        Text('IDR ' + _dataItem[index]['price'].toString()),
                    leading: IconButton(
                      onPressed: () {
                        _deleteItem(_dataItem[index]['id']);
                      },
                      icon: Icon(Icons.delete),
                      color: Colors.red[300],
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        showEditQtyDialog(
                            context,
                            _dataItem[index]['title'],
                            _dataItem[index]['subtitle'],
                            _dataItem[index]['price'],
                            isUpdate = true,
                            _dataItem[index]['id'],
                            index,
                            _dataItem[index]['food_item_key']);
                      },
                      icon: Icon(Icons.edit),
                      color: Colors.lightBlue[300],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    thickness: 0.3,
                  );
                },
              ),
            ),

            // Container(
            //   child: Text('asasdas\n\n\n\n\n\n\n\n\n'),
            // )

            Container(
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(16),
              child:  Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Payment Summary'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Sub Total'),
                      ),
                      // Text('IDR 60000'),
                      Text(returnTotal(_dataItem)),
                    ],
                  ),
                  const Row(
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
                      const Padding(
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
    );
  }
}
