import 'package:d_note_app/model/note_model.dart';
import 'package:d_note_app/views/widgets/note_item.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  
  Widget build(BuildContext context) {
    final Box<NoteModel> noteBox=Hive.box<NoteModel>('notes');
    return Expanded(
      child: ValueListenableBuilder(
        valueListenable: noteBox.listenable(),
         builder: (context, Box, child) 
         { return  ListView.builder(
          itemCount: noteBox.length,
          itemBuilder: (context,index){
            final note=noteBox.getAt(index)!;
            return NoteItem(note: note,
            onDelete: () async {
    await note.delete();
  },);
        
          }
          );}
      ),
    );
  }
}