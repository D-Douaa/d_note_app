// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:d_note_app/Constants/colors.dart';
import 'package:d_note_app/views/widgets/color_item.dart';

class ColorListView extends StatefulWidget {
  const ColorListView({
    Key? key,
    required this.onColorSelected,
    this.initialIndex,
  }) : super(key: key);
  final ValueChanged<Color> onColorSelected;
  final int?  initialIndex;
  
  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  late  int? currentIndex;
 @override
 void initState() {
   super.initState();
   currentIndex =widget.initialIndex??0;
 }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kNoteColors.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
              });

              widget.onColorSelected(kNoteColors[index]);
            },
            child: ColorItem(
              color: kNoteColors[index],
              isSelected: currentIndex == index,
            ),
          );
        },
      ),
    );
  }
}
