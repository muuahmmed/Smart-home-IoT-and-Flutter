// import 'package:flutter/material.dart';
//
//
// import '../util/app_colors.dart';
// import 'Gas.dart';
// import 'Temperature.dart';
// import 'fire.dart';
// import 'light.dart';
//
//
// class Services extends StatelessWidget {
//   const Services({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             cardItems(
//                 title: "GAS",
//                 image: "assets/images/energy.png",
//
//
//                onTab: (){   Navigator.push(context, MaterialPageRoute(builder: (context)=>Gas()));},
//
//             ),
//             cardItems(
//                onTab: (){   Navigator.push(context, MaterialPageRoute(builder: (context)=>Temperature()));},
//
//               title: "TEMPERATURE",
//               image: "assets/images/temperature.png",
//               color: primary,
//               fontColor: Colors.white,
//             ),
//           ],
//         ),
//         const SizedBox(height: 25,),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             cardItems(
//                 title: "Fire",
//                 image: "assets/images/water.png",
//               onTab: (){   Navigator.push(context, MaterialPageRoute(builder: (context)=>Fire()));},
//
//             ),
//             // cardItems(
//             //   title: "Light",
//             //   image: "assets/icons/light-bulb.png",
//             //   onTab: (){   Navigator.push(context, MaterialPageRoute(builder: (context)=>light(powerOn: false  ,)
//             //   )
//             //   );
//             //     },
//             //
//             // ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   GestureDetector cardItems({
//     required title,
//     required String image,
//     VoidCallback? onTab,
//     Color color = Colors.white,
//     Color fontColor = Colors.grey,
//   }) {
//     return GestureDetector(
//       onTap: onTab,
//       child: Material(
//         elevation: 15,
//         shadowColor: Colors.white38,
//         borderRadius: BorderRadius.circular(24),
//         child: Container(
//           width: 150,
//           padding: const EdgeInsets.symmetric(vertical: 35),
//           decoration: BoxDecoration(
//             color: color,
//             borderRadius: BorderRadius.circular(24),
//           ),
//           child: Column(
//             children: [
//               Image.asset(
//                 image,
//                 height: 80,
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 title,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: fontColor,
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }