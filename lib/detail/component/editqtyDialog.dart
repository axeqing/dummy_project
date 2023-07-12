import 'package:flutter/material.dart';
import 'package:dummy_project/constant.dart';
import 'package:numpad_layout/widgets/numPad.dart';





void showEditQtyDialog(BuildContext context) {
  
  String number = '';
  showDialog(
    context: context,
    builder: ((context) {
      return StatefulBuilder(builder: (context, StateSetter setState) {
        return Dialog(
          child: Container(
            width: 200,
            // height: 410,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(501)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Edit QTY',style: TextStyle(fontSize: 20),),
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
                        children: [Text('Hakaou'), Text('@83')],
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
                                    if (menuList[0]['subtitle'][0]['count'] >
                                        0) {
                                      menuList[0]['subtitle'][0]['count']--;
                                    }
                                  });
                                },
                                color: Colors.red,
                              ),
                              Text(menuList[0]['subtitle'][0]['count']
                                  .toString()),
                              IconButton(
                                icon: Icon(Icons.add),
                                color: Colors.green,
                                onPressed: () {
                                  setState(() {
                                    menuList[0]['subtitle'][0]['count']++;
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
                                    child: const Icon(Icons.remove_moderator)),
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
                          onPressed: () {},
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
