  //
  // import 'package:flutter/material.dart';
  //
  // class FetchData extends StatefulWidget {
  //   const FetchData({Key? key}) : super(key: key);
  //
  //   @override
  //   State<FetchData> createState() => _FetchDataState();
  // }
  //
  // class _FetchDataState extends State<FetchData> {
  //
  //   Query dbRef = FirebaseDatabase.instance.ref().child('Home');
  //   final reference = FirebaseDatabase.instance.ref('Home');
  //   final ref = FirebaseDatabase.instance.ref("Home/Gas");
  //   final ref2 = FirebaseDatabase.instance.ref("Home/fire");
  //   final ref3 = FirebaseDatabase.instance.ref("Home/photo");
  //   final ref4 = FirebaseDatabase.instance.ref("Home/temp");
  //
  //
  //   Widget listItem({required dynamic Home}) {
  //     return Container(
  //       margin: const EdgeInsets.all(3),
  //       padding: const EdgeInsets.all(3),
  //       height: 110,
  //       color: Colors.amberAccent,
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(
  //           Home['Home/fire'],
  //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
  //           ),
  //           const SizedBox(
  //             height: 5,
  //           ),
  //           Text(
  //             Home['Home/Gas'],
  //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
  //           ),
  //           const SizedBox(
  //             height: 5,
  //           ),
  //           Text(
  //             Home['Home/photo'],
  //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
  //           ),
  //           Text(
  //             Home['Home/temp'],
  //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
  //           ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.end,
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: [
  //               GestureDetector(
  //                 onTap: () {
  //                 },
  //                 child: Row(
  //                   children: [
  //                     Icon(
  //                       Icons.edit,
  //                       color: Theme.of(context).primaryColor,
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               const SizedBox(
  //                 width: 6,
  //               ),
  //               GestureDetector(
  //                 onTap: () {
  //                   reference.child(Home['key']).remove();
  //                 },
  //                 child: Row(
  //                   children: [
  //                     Icon(
  //                       Icons.delete,
  //                       color: Colors.red[700],
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           )
  //         ],
  //       ),
  //     );
  //   }
  //
  //   @override
  //   Widget build(BuildContext context) {
  //     return Scaffold(
  //         appBar: AppBar(
  //           title: const Text('Fetching data'),
  //         ),
  //         body: Column(
  //           children: [
  //             Expanded(
  //               child: FirebaseAnimatedList(
  //                 shrinkWrap: true,
  //                 query: ref,
  //                 itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
  //
  //
  //
  //
  //
  //                   return Column(
  //                     children: [
  //                       Text(
  //
  //                           snapshot.child("Home/Gas").value.toString()
  //                       ),
  //                   ],
  //
  //
  //                   );
  //
  //                 },
  //               ),
  //             ),
  //
  //           ],
  //         )
  //     );
  //   }
  // }
