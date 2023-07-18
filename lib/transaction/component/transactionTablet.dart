import 'package:flutter/material.dart';
import 'package:dummy_project/constant.dart';

class transactionTalet extends StatefulWidget {
  const transactionTalet({super.key});

  @override
  State<transactionTalet> createState() => _transactionTaletState();
}

class _transactionTaletState extends State<transactionTalet> {
  List<DataRow> _createRows() {
    return transtionList
        .map((e) => DataRow(cells: [
              DataCell(Text(e['receipt'])),
              DataCell(Text(e['posid'])),
              DataCell(Text(e['table'])),
              DataCell(Text(e['firstOtp'])),
              DataCell(Text(e['Total'].toString())),
              DataCell(Text(e['OpenDate'])),
              DataCell(Text(e['time'])),
              DataCell(Text(e['mode'])),
              DataCell(Text(e['sales'].toString())),
              DataCell(Text(e['convers'].toString())),
            ]))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          titleSpacing: -2,
          elevation: 0,
          title: const Text(
            'All Transaction',
            style: TextStyle(color: Colors.black),
          ),
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
                  'New Tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsetsDirectional.all(8),
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            )),
                        onPressed: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('All'),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 18.0, bottom: 18, left: 10),
                              child: Icon(Icons.radio_button_checked),
                            )
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            )),
                        onPressed: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Selected Operator'),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 18.0, bottom: 18, left: 10),
                              child: Icon(Icons.radio_button_checked),
                            )
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            )),
                        onPressed: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('RFID'),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 18.0, bottom: 18, left: 10),
                              child: Icon(Icons.radio_button_checked),
                            )
                          ],
                        )),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Empty',
                            suffixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    border: TableBorder(
                        verticalInside:
                            BorderSide(width: 1, style: BorderStyle.solid),
                        bottom: BorderSide(width: 1, style: BorderStyle.solid)),
                    columns: [
                      DataColumn(label: Center(child: Text('No. Receipt'))),
                      DataColumn(label: Center(child: Text('POSID'))),
                      DataColumn(label: Center(child: Text('Table'))),
                      DataColumn(label: Center(child: Text('First OP'))),
                      DataColumn(label: Center(child: Text('Total'))),
                      DataColumn(label: Center(child: Text('Open Date'))),
                      DataColumn(label: Center(child: Text('Time'))),
                      // DataColumn(label: Text('Close Date')),
                      // DataColumn(label: Text('Time')),
                      // DataColumn(label: Text('Spl')),
                      // DataColumn(label: Text('Opn')),
                      // DataColumn(label: Text('Prm')),
                      // DataColumn(label: Text('Tbl')),
                      DataColumn(label: Center(child: Text('Mode'))),
                      DataColumn(label: Center(child: Text('Sales No.'))),
                      DataColumn(label: Center(child: Text('Convers'))),
                    ],
                    // rows:_createRows(),
                    rows: [
                      for (var item in transtionList)
                        DataRow(cells: [
                          DataCell(Center(child: Text(item['receipt']))),
                          DataCell(Center(child: Text(item['posid']))),
                          DataCell(Center(child: Text(item['table']))),
                          DataCell(Center(child: Text(item['firstOtp']))),
                          DataCell(Center(child: Text(item['Total'].toString()))),
                          DataCell(Center(child: Text(item['OpenDate']))),
                          DataCell(Center(child: Text(item['time']))),
                          DataCell(Center(child: Text(item['mode']))),
                          DataCell(Center(child: Text(item['sales'].toString()))),
                          DataCell(Center(child: Text(item['convers'].toString()))),
                        ])
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
