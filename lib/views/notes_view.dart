import 'package:d_note_app/views/add_note_form.dart';
import 'package:d_note_app/views/notes_view_body.dart';
import 'package:flutter/material.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return AddNoteForm();
            },
          );
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(child: NotesViewBody()),
    );
  }
}
