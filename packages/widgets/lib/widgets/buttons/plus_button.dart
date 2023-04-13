// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';
// import 'package:gogogogoa/ui/widgets/buttons/loading_switcher.dart';
// import 'package:gogogogoa/ui/widgets/loader/my_loading_indicator.dart';

// import '../../../theme/color_constants.dart';

// class PlusButton extends StatelessWidget {
//   final FutureVoidCallback? onPressed;
//   final bool isDisabled;

//   const PlusButton({
//     Key? key,
//     required this.onPressed,
//     this.isDisabled = false,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox.square(
//       dimension: 25,
//       child: LoadingSwitcher(
//         loadingChild: _loadingChild(),
//         child: _plusIcon(),
//         onPressed: onPressed ?? () async {},
//       ),
//     );
//   }

//   Container _plusIcon({Color color = kPrimaryColor}) {
//     return Container(
//       alignment: Alignment.center,
//       padding: EdgeInsets.all(4),
//       height: 25,
//       width: 25,
//       decoration: BoxDecoration(
//         border: Border.all(color: color),
//         borderRadius: BorderRadius.circular(5),
//       ),
//       child: Icon(
//         Icons.add,
//         size: 15,
//         color: kPrimaryColor,
//       ),
//     );
//   }

//   Widget _loadingChild() {
//     return MyLoadingIndicator(
//       size: 15,
//     );
//   }
// }
