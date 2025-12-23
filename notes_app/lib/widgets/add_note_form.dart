import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/helper/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_list_builder.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  late String title;
  late String content;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Field is required';
              } else {
                return null;
              }
            },
            onSaved: (newValue) => title = newValue!,
            decoration: const InputDecoration(hintText: 'Note Title'),
            style: const TextStyle(color: kPrimaryColor),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Field is required';
              } else {
                return null;
              }
            },
            onSaved: (newValue) => content = newValue!,
            style: const TextStyle(color: kPrimaryColor),
            decoration: const InputDecoration(hintText: 'Content'),
            maxLines: 10,
          ),
          const SizedBox(height: 16.0),
          ColorsListBuilder(),
          const SizedBox(height: 16.0),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              DateTime currentDate = DateTime.now();
              String formattedDate = DateFormat(
                'dd MMM, yyyy',
              ).format(currentDate);
              return OutlinedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    NoteModel note = NoteModel(
                      title: title,
                      content: content,
                      color: BlocProvider.of<AddNoteCubit>(context).color.value,
                      createdAt: formattedDate,
                    );
                    BlocProvider.of<AddNoteCubit>(context).addNote(note);
                    Navigator.pop(context);
                  } else {
                    _autovalidateMode = AutovalidateMode.always;
                  }
                },
                child: state is AddNoteLoading
                    ? SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(color: Colors.black),
                      )
                    : Text('Add Note'),
              );
            },
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}




