import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_item_model.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/views/notes_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/views/simple_bloc_observer.dart';
import 'package:notes_app/widgets/note_item.dart';


Future<void> main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteItemModelAdapter());
  await Hive.openBox<NoteItemModel>('notesBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Color(0xFF303030)),
        debugShowCheckedModeBanner: false,
        initialRoute: NotesView.route,
        routes: {
          NotesView.route: (build) => NotesView(),
        },

      ),
    );
  }
}
