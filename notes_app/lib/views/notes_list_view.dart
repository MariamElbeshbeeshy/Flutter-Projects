import 'package:flutter/material.dart';
import 'package:notes_app/helper/constants.dart';
import 'package:notes_app/widgets/add_note_bottom_sheet.dart';
import 'package:notes_app/widgets/custom_icon_button.dart';
import 'package:notes_app/widgets/notes_card_list_builder.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        actions: [CustomIconButton(icon: Icons.search, onPressed: () => {})],
      ),
      body: const NotesCardListBuilder(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => AddNoteBottomSheet(),
          );
        },
        backgroundColor: kPrimaryColor,
        shape: CircleBorder(),
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
