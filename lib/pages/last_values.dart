// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
//
// class FetchLastValue extends StatefulWidget {
//   const FetchLastValue({Key? key}) : super(key: key);
//
//   @override
//   State<FetchLastValue> createState() => _FetchLastValueState();
// }
//
// class _FetchLastValueState extends State<FetchLastValue> {
//   final DatabaseReference dbRef = FirebaseDatabase.instance.reference().child('Home/Gas');
//   String _lastGasValue = ''; // Initialize with an empty string
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchLastValue();
//   }
//
//   Future<void> _fetchLastValue() async {
//     try {
//       final dataSnapshot = await dbRef.orderByKey().limitToLast(1).once();
//       final data = dataSnapshot.snapshot.value;
//       if (data != null) {
//         setState(() {
//           _lastGasValue = (data as Map).values.first.toString();
//         });
//       }
//     } catch (e) {
//       print('Error fetching last value: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Display Last Gas Value'),
//       ),
//       body: Center(
//         child: _lastGasValue.isNotEmpty
//             ? Text('Last Gas Value: $_lastGasValue')
//             : CircularProgressIndicator(), // or any loading indicator
//       ),
//     );
//   }
// }
