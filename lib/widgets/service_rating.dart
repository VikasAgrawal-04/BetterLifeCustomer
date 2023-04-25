// import 'package:api/api.dart';
// import 'package:better_life_customer/services/dialog_service.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_rating_stars/flutter_rating_stars.dart';
// import 'package:text_fields/text_fields.dart';
// import 'package:widgets/widgets.dart';


// class ServiceRating extends StatefulWidget {
//   const ServiceRating({super.key, required this.appointmentId});
//   final int appointmentId;

//   @override 
//   State<ServiceRating> createState() => _ServiceRatingState();
// }

// class _ServiceRatingState extends State<ServiceRating> {
//   // double value = 0;
//   final Map<int, double> _ratings = <int, double>{};
//   TextEditingController _controller = TextEditingController();
//   GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   @override
//   void initState() {
//     _controller = TextEditingController();
//     _formKey = GlobalKey<FormState>();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     _formKey.currentState?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const MyAppBar(),
//       body: Form(
//         key: _formKey,
//         child: SingleChildScrollView(
//           padding: kPadding,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const HeaderText(
//                 text: 'Service Rating',
//                 fontSize: 26,
//               ),
//               const Gap(20),
//               Text(
//                 'Share your experience in a scaling',
//                 style: context.textTheme.titleMedium,
//               ),
//               const Gap(10),
//               ServiceRatingStars(
//                 onChanged: onChanged,
//                 value: value,
//               ),
//               const Gap(20),
//               MyTextField(
//                 hintText: 'Write your review',
//                 controller: _controller,
//                 maxLines: 5,
//               ),
//               const Gap(20),
//               MyElevatedButton(
//                 text: 'Submit',
//                 onPressed: _onPressed,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildRatingCard(Caretaker caretaker) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               caretaker.fullname ?? '',
//               style: context.textTheme.titleMedium,
//             ),
//             const Gap(10),
//             ServiceRatingStars(
//               onChanged: (value) => setState(() {
//                 final params = _ServiceRatingParams(
//                   appointmentId: widget.appointmentId,
//                   rating: value,
//                   comment: comment,
//                 );
//                 _ratings[caretaker.userid!] = value;
//               }),
//               value: _ratings[caretaker.userid!] ?? 0.0,
//             ),
//             const Gap(10),
//             MyTextField(
//               hintText: 'Write your review',
//               controller: caretaker.controller,
//               maxLines: 5,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _onPressed() async {
//     if (!(_formKey.currentState?.validate() ?? false)) {
//       return;
//     }

//     if (value <= 0) {
//       DialogService.error('Please select rating');
//       return;
//     }

//     final params = ServiceRatingParams(
//       appointmentId: widget.appointmentId,
//       rating1: value.toInt(),
//       comment1: _controller.text,
//     );

//     final api = context.read<ApiRepo>();
//     final result = await api.serviceRating(params: params);
//     result.when(
//       success: (data) {
//         DialogService.success(
//           data,
//           onTap: () async {
//             await api.getAppointments(type: AppointmentType.past);
//             Get.close(2);
//           },
//         );
//       },
//       failure: DialogService.failure,
//     );
//   }

//   void onChanged(double value) {
//     setState(() {
//       this.value = value;
//     });
//   }
// }

// class ServiceRatingStars extends StatelessWidget {
//   const ServiceRatingStars({
//     this.onChanged,
//     this.starSize = 50,
//     super.key,
//     this.value,
//   });

//   final double? value;
//   final double starSize;
//   final ValueChanged<double>? onChanged;

//   @override
//   Widget build(BuildContext context) {
//     return RatingStars(
//       value: value ?? 0.0,
//       onValueChanged: onChanged,
//       starBuilder: _starBuilder,
//       animationDuration: const Duration(milliseconds: 375),
//       starSize: starSize,
//       maxValueVisibility: false,
//       valueLabelVisibility: false,
//     );
//   }

//   Icon _starBuilder(int index, Color? color) {
//     return Icon(
//       Icons.star,
//       size: starSize,
//       color: color,
//     );
//   }
// }
