import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/helper/constants.dart';
import 'package:notes_app/widgets/color_item.dart';

class ColorsListBuilder extends StatefulWidget {
  const ColorsListBuilder({super.key});

  @override
  State<ColorsListBuilder> createState() => _ColorsListBuilderState();
}

class _ColorsListBuilderState extends State<ColorsListBuilder> {
  int? chosenIndex;
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
            });
            BlocProvider.of<AddNoteCubit>(context).color = kColors[index];
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