import 'package:flutter/material.dart';

class transaction extends StatefulWidget {
  const transaction({super.key});

  @override
  State<transaction> createState() => _transactionState();
}

class _transactionState extends State<transaction> {
  List<Map> transactionList = [
    {'title': 'Copy Bill'},
    {'title': 'Tender'},
    {'title': 'Tender'},
    {'title': 'Kitchen Re-Print'},
  ];

  @override
  Widget build(BuildContext context) {
    void showTransactionList() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(18),
                    child: const Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '05/09/2022 15:02:41',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'POSID',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              'Raptor',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'A22000001669',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                            Text(
                              'SF1',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // Padding(
                            //   padding: EdgeInsets.all(8.0),
                            //   child: Text('Grand Total'),
                            // ),
                            Text(
                              'IDR 60000',
                              style: TextStyle(fontSize: 25),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  ListView.builder(
                    padding: EdgeInsets.only(bottom: 100),
                    shrinkWrap: true,
                    itemCount: transactionList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(color: Colors.black),
                          ),
                          title: Text(transactionList[index]['title']),
                        ),
                      );
                    },
                  )
                ],
              ),
            );
          });
        },
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
          titleSpacing: -2,
          // automaticallyImplyLeading: false,
          title: const Text(
            'Transaction',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(18),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ListTile(
                      title: const Text('All'),
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4),
                            bottomLeft: Radius.circular(4)),
                      ),
                      contentPadding: EdgeInsets.only(left: 18),
                      trailing: IconButton(
                        splashRadius: 35,
                        onPressed: () {},
                        icon: Icon(Icons.expand_more),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Empty',
                        suffixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(4),
                                bottomRight: Radius.circular(4))),
                      ),
                    ),
                  )
                ],
              ),
              InkWell(
                onTap: () {
                  showTransactionList();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(top: 18),
                  // margin: EdgeInsets.all(16),
                  child: const Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            '05/09/2022 15:02:41',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'POSID',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            'Raptor',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'A22000001669',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),
                          Text(
                            'SF1',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // Padding(
                          //   padding: EdgeInsets.all(8.0),
                          //   child: Text('Grand Total'),
                          // ),
                          Text(
                            'IDR 60000',
                            style: TextStyle(fontSize: 25),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
