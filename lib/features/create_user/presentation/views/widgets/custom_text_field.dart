import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/core/utils/functions/custom_shadow.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.onSubmitted});

  final Function(String?)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 36.w),
      child: Container(
        decoration: buildShadow(
          context,
          Theme.of(context).colorScheme.onPrimaryContainer,
          8.r,
        ),
        child: TextFormField(
          onSaved: onSubmitted,
          validator: (value) {
            if (value!.isEmpty) {
              return "This field is Required.";
            } else if (value.length >= 10) {
              return "This username is too long.";
            } else {
              return null;
            }
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            hintText: "FullName",
            hintStyle: AppStyles.style15.copyWith(
              fontWeight: FontWeight.normal,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            border: buildBorder(context),
            enabledBorder: buildBorder(context),
            focusedBorder: buildBorder(context),
            filled: true,
            fillColor: Theme.of(context).colorScheme.surface,
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder(context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}
