// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class AddQuantity extends StatefulWidget {
//   final VoidCallback increased;
//   final VoidCallback decreased;
//   final double scale; // Scale factor to adjust the widget size

//   const AddQuantity({super.key, this.scale = 1, required this.increased, required this.decreased});

//   @override
//   State<AddQuantity> createState() => _AddQuantityState();
// }


// class _AddQuantityState extends State<AddQuantity> {
//   @override
//   Widget build(BuildContext context) {
//     // Calculate padding dynamically based on the scale
//     final double numPadding = 14 * widget.scale;
//     final double numwidth = 10 * widget.scale;

//     return Row(
//       children: [
//         // Decrease button
//         IconButton(
//           onPressed: widget.decreased,
//           icon: Icon(Icons.remove, size: 32 * widget.scale, color: Color(0XFFB3B3B3)),
//         ),
        
//         // Quantity display container
//         Container(
//           height: 65 * widget.scale,
//           width: 65 * widget.scale,
//           decoration: BoxDecoration(
//             border: Border.all(color: Color(0XFFE2E2E2)),
//             borderRadius: BorderRadius.all(Radius.circular(25*widget.scale)),
//           ),
//           child: Padding(
//             padding: EdgeInsets.all(numPadding),
//             child: BlocBuilder<CartController>(
//               builder: (controller, state) {
//                 return Text(
//                   "${widget.qty.value}",
//                   style: TextStyle(
//                     fontSize: 30 * widget.scale, // Adjust text size based on scale
//                     fontWeight: FontWeight.w400,
//                   ),
//                   textAlign: TextAlign.center,
//                 );
//               },
//             ),
//           ),
//         ),        
//         // Increase button
//         IconButton(
//           onPressed: widget.increased,
//           icon: Icon(Icons.add, size: 32 * widget.scale, color: Color(0XFF53B175)),
//         ),
//       ],
//     );
//   }
// }
