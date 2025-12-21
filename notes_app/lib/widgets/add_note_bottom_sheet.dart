import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/widgets/add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 16.0),
      child: SizedBox(
        height: 500,
        child: SingleChildScrollView(
          child: BlocConsumer(
            builder: (context, state) {
              return ModalProgressHUD(
                inAsyncCall: state is AddNoteLoading ? true : false,
                child: AddNoteForm(),
              );
            },
            listener: (context, state) {
              if (state is AddNoteSuccess) {
                Navigator.pop(context);
              } else if (state is AddNoteFailure) {
                print('failed: ${state.errMssg}');
              }
            },
          ),
        ),
      ),
    );
  }
}
