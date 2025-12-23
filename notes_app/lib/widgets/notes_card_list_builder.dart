import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit.dart/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/note_view.dart';
import 'package:notes_app/widgets/note_card.dart';

class NotesCardListBuilder extends StatelessWidget {
  const NotesCardListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        if (state is NotesSuccess) {
          List<NoteModel> notes = state.notes;
          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Navigator.pushNamed(
                  context,
                  NoteView.id,
                  arguments: notes[index],
                ),
                child: NoteCard(note: notes[index], maxLines: 2),
              );
            },
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
