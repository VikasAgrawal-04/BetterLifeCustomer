import 'package:better_life_customer/caretaker/widgets/img_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:text_fields/text_fields.dart';
import 'package:widgets/widgets.dart';

class DoctorNotes extends StatefulWidget {
  const DoctorNotes({super.key});

  @override
  State<DoctorNotes> createState() => _DoctorNotesState();
}

class _DoctorNotesState extends State<DoctorNotes> {
  final notes = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: Text('Better-Life Caretaker'),
      ),
      body: SingleChildScrollView(
        padding: kPadding,
        child: Column(
          children: [
            const HeaderText(text: 'Doctor Notes'),
            const Gap(20),
            MyTextField(
              autovalidateMode: AutovalidateMode.disabled,
              maxLines: 8,
              controller: notes,
              textInputAction: TextInputAction.done,
            ),
            const Gap(5),
            MyElevatedButton(
              width: 0.3.sw,
              text: 'Save',
              onPressed: () async {},
            ),
            const Gap(10),
            const MyDivider(),
            const Gap(10),
            Row(
              children: [
                const Spacer(),
                const Text('Upload Photos'),
                SizedBox(width: 0.2.sw),
                IconButton(
                  onPressed: () async {
                    await imgSheet(onPick: (value) async {});
                  },
                  icon: const Icon(Icons.camera_alt),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
