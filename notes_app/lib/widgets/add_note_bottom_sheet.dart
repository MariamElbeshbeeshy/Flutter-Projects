import 'package:flutter/material.dart';
import 'package:notes_app/widgets/add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 16.0),
      child: const SizedBox(
        height: 500,
        child: SingleChildScrollView(
          child: AddNoteForm(),
        ),
      ),
    );
  }
}


