import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
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
