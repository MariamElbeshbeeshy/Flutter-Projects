import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit.dart/notes_cubit.dart';
import 'package:notes_app/helper/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/widgets/custom_icon_button.dart';
import 'package:notes_app/widgets/note_card.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key, required this.note});
  final NoteModel note;
  static String id = 'note_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            BlocProvider.of<NotesCubit>(context).fetchNotes();
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text('Notes'),
        actions: [CustomIconButton(icon: Icons.note, onPressed: () => {})],
      ),
      body: SingleChildScrollView(child: NoteCard(note: note)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, EditNoteView.id, arguments: note);
        },
        backgroundColor: kPrimaryColor,
        shape: CircleBorder(),
        child: const Icon(Icons.edit, color: Colors.black),
      ),
    );
  }
}
