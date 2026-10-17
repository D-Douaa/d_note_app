import 'package:d_note_app/views/widgets/CustomAppBar.dart';
import 'package:d_note_app/views/widgets/notes_list_view.dart';
import 'package:flutter/material.dart';
class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16,),
      child: Column(children: [
        Customappbar(title: 'Note',icon: (Icons.search),),
        NotesListView()
        ],),
      );
  }
}