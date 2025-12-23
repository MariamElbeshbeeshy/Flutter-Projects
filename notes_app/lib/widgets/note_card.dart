import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit.dart/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';

class NoteCard extends StatelessWidget {
  final NoteModel note;
  final int? maxLines;
  const NoteCard({super.key, required this.note, this.maxLines});

  @override
  Widget build(BuildContext context) {
    GlobalKey onDismess = GlobalKey();
    return Dismissible(
      key: onDismess,
      background: Container(
        margin: EdgeInsets.only(top: 16),
        color: Colors.green,
        alignment: Alignment.centerLeft,
        child: const Icon(Icons.archive),
      ),
      secondaryBackground: Container(
        margin: EdgeInsets.only(top: 16),
        color: Colors.red,
        alignment: Alignment.centerRight,
        child: const Icon(Icons.delete),
      ),
      onDismissed: (direction) {
        note.delete();
        BlocProvider.of<NotesCubit>(context).fetchNotes();
      },
      confirmDismiss: (direction) async {
        return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Confirm"),
            content: const Text("Are you sure you want to delete this?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text("No"),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text("Yes"),
              ),
            ],
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(26, 20.0, 5, 20.0),
        margin: EdgeInsets.fromLTRB(16.0, 16, 16, 0),
        width: double.infinity,

        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              isThreeLine: true,
              contentPadding: EdgeInsets.zero,
              title: Text(
                note.title,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  note.content,
                  maxLines: maxLines,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: const Color.fromARGB(221, 84, 83, 83),
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Confirm"),
                      content: const Text(
                        "Are you sure you want to delete this?",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("No"),
                        ),
                        TextButton(
                          onPressed: () {
                            note.delete();
                            BlocProvider.of<NotesCubit>(context).fetchNotes();
                            Navigator.pop(context);
                          },
                          child: const Text("Yes"),
                        ),
                      ],
                    ),
                  );
                },
                icon: Icon(Icons.delete),
                color: Colors.black87,
                iconSize: 32.0,
                padding: EdgeInsets.zero,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [],
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  note.createdAt,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: const Color.fromARGB(221, 84, 83, 83),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
