import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';

class ThemeSection extends StatefulWidget {
  const ThemeSection({super.key});

  @override
  State<ThemeSection> createState() => _ThemeSectionState();
}

class _ThemeSectionState extends State<ThemeSection> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Opacity(
          opacity: .5,
          child: Text(
            "Theme",
            style: AppStyles.style15,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 80.w,
            ),
            Text(
              "Using System Theme",
              style: AppStyles.style13.copyWith(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            FlutterSwitch(
              value: status,
              width: 60.w,
              height: 30.h,
              inactiveIcon: const Icon(Icons.brightness_5_sharp),
              toggleColor: Colors.black,
              activeIcon: const Icon(Icons.dark_mode_outlined),
              activeColor: Colors.white,
              inactiveColor: Colors.white,
              onToggle: (value) {
                setState(() {
                  status = value;
                });
              },
            )
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
