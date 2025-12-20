import 'package:flutter/material.dart';
import 'package:notes_app/helper/constants.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  String? title;
  String? content;
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
            onSaved: (newValue) => title = newValue,
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
            onSaved: (newValue) => content = newValue,
            style: const TextStyle(color: kPrimaryColor),
            decoration: const InputDecoration(hintText: 'Content'),
            maxLines: 10,
          ),
          const SizedBox(height: 16.0),

          OutlinedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Navigator.pop(context);
              } else {
                _autovalidateMode = AutovalidateMode.always;
              }
            },
            child: const Text('Add Note'),
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
