// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';

// import '../buttons/buttons.dart';

// class DeleteDialog extends StatelessWidget {
//   final Future<void> Function()? onDelete, onCancel;
//   const DeleteDialog({Key? key, this.onDelete, this.onCancel})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: kPadding,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Lottie.asset(
//             Assets.animations.delete,
//             height: 100,
//             width: 100,
//           ),
//           Gap(20.h),
//           Text(
//             'Are you sure you want to delete this item?',
//             style: TextStyle(
//               fontSize: 14.sp,
//               color: const Color(0xff414141),
//               fontFamily: 'Gotham',
//             ),
//           ),
//           // yes no buttons
//           Gap(20.h),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 child: MyElevatedButton(
//                   onPressed: () async {
//                     Get.back();
//                   },
//                   // context,
//                   text: 'No',
//                   color: const Color(0xffE5E5E5),

//                   // textColor: Color(0xff414141),
//                 ),
//               ),
//               Gap(30.h),
//               Expanded(
//                 child: MyElevatedButton(
//                   onPressed: () async {
//                     try {
//                       onDelete?.call();
//                       // if (onDelete != null) {
//                       //   Get.back();
//                       // }
//                     } catch (e) {
//                       Get.back();
//                     }
//                   },
//                   text: 'Yes',
//                 ),
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
