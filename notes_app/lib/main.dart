import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/cubits/notes_cubit.dart/notes_cubit.dart';
import 'package:notes_app/helper/constants.dart';
import 'package:notes_app/helper/simple_bloc_observer.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/views/note_view.dart';
import 'package:notes_app/views/notes_list_view.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,

          brightness: Brightness.dark,
          scaffoldBackgroundColor: kDarkBackgroundColor,
          appBarTheme: AppBarTheme(
            backgroundColor: kDarkBackgroundColor,
            foregroundColor: Colors.white,
          ),
          fontFamily: 'Poppins',
          inputDecorationTheme: InputDecorationTheme(
            contentPadding: EdgeInsets.all(16.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.red),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: kPrimaryColor),
            ),
            hintStyle: TextStyle(color: Colors.grey[400]),
          ),
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: kPrimaryColor,
          ),
          textTheme: const TextTheme(
            titleMedium: TextStyle(color: Colors.black),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              textStyle: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.normal,
              ),
              backgroundColor: kPrimaryColor,
              foregroundColor: kSecondaryColor,
              minimumSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide.none,
              ),
            ),
          ),
        ),
        routes: {
          EditNoteView.id: (context) => EditNoteView(note: ModalRoute.of(context)!.settings.arguments as NoteModel),
          NoteView.id: (context) => NoteView(note: ModalRoute.of(context)!.settings.arguments as NoteModel),
        },
        home: Scaffold(body: Center(child: NotesListView())),
      ),
    );
  }
}
