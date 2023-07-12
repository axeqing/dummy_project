import 'package:flutter/material.dart';

// class Functionlist extends StatelessWidget {
//   Functionlist({super.key});

//   List<String> function = <String>[
//     'All Void',
//     'Float in',
//     'FOC item ',
//     'Paid Out',
//     'Preview Bill',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           title: const Text(
//             'Function',
//             style: TextStyle(color: Colors.black),
//           ),
//           actions: [IconButton(onPressed: null, icon: Icon(Icons.close))],
//         ),
//         body: ListView.separated(
//           itemCount: function.length,
//           itemBuilder: (context, index) {
//             return ListTile(
//               title: Text(function[index]),
//             );
//           },
//           separatorBuilder: (BuildContext context, int index) {
//             return const Divider(
//               thickness: 2,
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

class Functiolist extends StatefulWidget {
  const Functiolist({super.key});

  @override
  State<Functiolist> createState() => _FunctiolistState();
}

class _FunctiolistState extends State<Functiolist> {
  List<String> function = <String>[
    'All Void',
    'Float in',
    'FOC item ',
    'Paid Out',
    'Preview Bill',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: const Text(
            'Function',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(onPressed: (){
              Navigator.pop(context);

          }, icon: Icon(Icons.close,color: Colors.black,))],
        ),
        body: ListView.separated(
          
          itemCount: function.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(function[index]),
              
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              thickness: 2,
            );
          },
        ),
      ),
    );
  }
}
