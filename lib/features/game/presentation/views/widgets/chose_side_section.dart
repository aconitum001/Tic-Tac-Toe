import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ChoseSideSection extends StatefulWidget {
  const ChoseSideSection({
    super.key,
    required this.skins,
    required this.onOptionChanged,
  });

  final List<String> skins;
  final Function(List<String>) onOptionChanged;

  @override
  State<ChoseSideSection> createState() => _ChoseSideSectionState();
}

class _ChoseSideSectionState extends State<ChoseSideSection> {
  late List<String> currentOption;
  late List<dynamic> options;

  @override
  void initState() {
    super.initState();
    options = [
      [widget.skins[1], widget.skins[0]],
      [widget.skins[0], widget.skins[1]],
    ];
    currentOption = options[0];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 60.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                widget.skins[1],
                width: 65.w,
                height: 65.h,
              ),
              SizedBox(
                width: 22.w,
              ),
              Radio(
                value: options[0],
                groupValue: currentOption,
                activeColor: Theme.of(context).colorScheme.primaryContainer,
                onChanged: (value) {
                  setState(() {
                    currentOption = value!;
                  });

                  widget.onOptionChanged(currentOption);
                },
              ),
              Radio(
                value: options[0],
                groupValue: currentOption,
                activeColor: Theme.of(context).colorScheme.primaryContainer,
                onChanged: (value) {
                  setState(() {
                    currentOption = value!;
                  });
                  widget.onOptionChanged(currentOption);
                },
              ),
              SizedBox(
                width: 22.w,
              ),
              SvgPicture.asset(
                widget.skins[0],
                width: 65.w,
                height: 65.h,
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              if (currentOption == options[0]) {
                setState(() {
                  currentOption = options[1];
                });
                widget.onOptionChanged(currentOption);
              } else {
                setState(() {
                  currentOption = options[0];
                });
                widget.onOptionChanged(currentOption);
              }
            },
            icon: Icon(
              Icons.swap_horiz_rounded,
              size: 35.w,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  widget.skins[0],
                  width: 65.w,
                  height: 65.h,
                ),
                SizedBox(
                  width: 22.w,
                ),
                Radio(
                  value: options[1],
                  groupValue: currentOption,
                  activeColor: Theme.of(context).colorScheme.primaryContainer,
                  onChanged: (value) {
                    setState(() {
                      currentOption = value!;
                    });
                    widget.onOptionChanged(currentOption);
                  },
                ),
                Radio(
                  value: options[1],
                  groupValue: currentOption,
                  activeColor: Theme.of(context).colorScheme.primaryContainer,
                  onChanged: (value) {
                    setState(() {
                      currentOption = value!;
                    });
                    widget.onOptionChanged(currentOption);
                  },
                ),
                SizedBox(
                  width: 22.w,
                ),
                SvgPicture.asset(
                  widget.skins[1],
                  width: 66.w,
                  height: 65.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
