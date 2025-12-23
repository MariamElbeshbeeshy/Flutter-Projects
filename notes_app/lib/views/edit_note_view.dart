import 'package:flutter/material.dart';
import 'package:notes_app/helper/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_icon_button.dart';

class EditNoteView extends StatefulWidget {
  final NoteModel note;
  const EditNoteView({super.key, required this.note});
  static const String id = 'edit_note_view';

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        actions: [
          CustomIconButton(
            icon: Icons.check,
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.content = content ?? widget.note.content;
              widget.note.save();
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              initialValue: widget.note.title,
              onChanged: (newValue) => title = newValue,
              decoration: InputDecoration(hintText: widget.note.title),
              style: TextStyle(color: kPrimaryColor),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              initialValue: widget.note.content,
              onChanged: (newValue) => content = newValue,
              style: TextStyle(color: kPrimaryColor),
              decoration: InputDecoration(hintText: widget.note.content),
              maxLines: 10,
            ),
          ],
        ),
      ),
    );
  }
}
