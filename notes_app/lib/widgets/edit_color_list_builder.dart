import 'package:flutter/material.dart';
import 'package:notes_app/helper/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/color_item.dart';

class EditColorListBuilder extends StatefulWidget {
  final NoteModel note;
  const EditColorListBuilder({super.key, required this.note});

  @override
  State<EditColorListBuilder> createState() => _EditColorListBuilderState();
}

class _EditColorListBuilderState extends State<EditColorListBuilder> {
  int? chosenIndex;

  @override
  void initState() {
    chosenIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        itemCount: kColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              chosenIndex = index;
              widget.note.color = kColors[index].value;
            });
          },
          child: ColorItem(
            color: kColors[index],
            isActive: index == chosenIndex,
          ),
        ),
      ),
    );
  }
}
