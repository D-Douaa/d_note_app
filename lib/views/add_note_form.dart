import 'package:d_note_app/Constants/colors.dart';
import 'package:d_note_app/model/note_model.dart';
import 'package:d_note_app/views/widgets/color_list_view.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final formkey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final Box<NoteModel> notebox=Hive.box<NoteModel>('notes');
  Color selectedColor = kNoteColors[0];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(.8),
      child: Form(
      
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Column(
            children: [
              SizedBox(height: 20,),
              TextFormField(
                 style: TextStyle(color: Colors.white,),
                controller: titleController,
                decoration: InputDecoration(
                  
                  hint: Text('title',style: TextStyle(color: Colors.white,),),
                  labelText: 'title',
                  prefixIcon: Icon(Icons.title),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'title is required';
                  } else {
                    return null;
                  }
                },
                maxLines: 1,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 30),
              TextFormField(
                style: TextStyle(color: Colors.white,),
                controller: contentController,
                decoration: InputDecoration(
                  hint: Text('content',style: TextStyle(color: Colors.white,)),
                  labelText: 'content',
                  prefixIcon: Icon(Icons.abc_outlined),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'content is required';
                  } else {
                    return null;
                  }
                },
                maxLines: 6,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 30),
              Center(
                child: ColorListView(
                  onColorSelected: (color){
                 setState(() {
                selectedColor=color;
                    });
                  }),
              ),
                SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async{
                  if (formkey.currentState!.validate()) {
                  final note=NoteModel(
                    title: titleController.text,
                     content: contentController.text,
                      color: selectedColor.value,
                      date: DateTime.now());
                  await notebox.add(note);
                  
                    ///
                    titleController.clear();
                    contentController.clear();
                    setState(() {
                      selectedColor=kNoteColors[0];
                    });
                    Navigator.pop(context);
                  }
                },
                child: Text('save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
