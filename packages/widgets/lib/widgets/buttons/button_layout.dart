// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';

// class ButtonLayout extends StatelessWidget {
//   final EdgeInsets? padding;
//   final VoidCallback? onTap;
//   final String? imagePath;
//   final String text;
//   final TextStyle? style;
//   const ButtonLayout(
//       {Key? key,
//       this.imagePath,
//       required this.text,
//       this.style,
//       this.onTap,
//       this.padding})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     const style = TextStyle(
//       fontSize: 8,
//       color: Color(0xff414141),
//     );
//     return _inkWell(
//       onTap: onTap,
//       child: Row(
//         children: [
//           if (imagePath != null) SvgPicture.asset(imagePath!),
//           if (imagePath != null) Gap(5.w),
//           const Text('Edit', style: style ?? style),
//         ],
//       ),
//     );
//   }

//   Widget _inkWell({VoidCallback? onTap, required Widget child}) {
//     return Material(
//       borderRadius: kBorderRadius,
//       color: Colors.transparent,
//       child: InkWell(
//         borderRadius: kBorderRadius,
//         onTap: onTap,
//         child: Container(
//           padding: padding ??
//               const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
//           child: child,
//         ),
//       ),
//     );
//   }
// }
