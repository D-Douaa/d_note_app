import 'package:d_note_app/Constants/colors.dart';
import 'package:d_note_app/model/note_model.dart';
import 'package:d_note_app/views/widgets/CustomAppBar.dart';
import 'package:d_note_app/views/widgets/color_list_view.dart';
import 'package:flutter/material.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key, required this.note});
  final NoteModel note;

  State<EditNoteView> createState() => _EditNoteViewState();
}

@override
class _EditNoteViewState extends State<EditNoteView> {
  late TextEditingController titleController;
  late TextEditingController contentController;
  late Color selectedColor;
  @override
  void initState() {
    super.initState();
   

    titleController = TextEditingController(text: widget.note.title);
    contentController = TextEditingController(text: widget.note.content);
    selectedColor=Color(widget.note.color);
  } @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    
    super.dispose();
  }
  Future <void> saveNote()async{
    widget.note.title=titleController.text;
              widget.note.content=contentController.text;
              widget.note.color=selectedColor.value;
              await widget.note.save();
              Navigator.pop(context);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff003366),
      body: SafeArea(
       child: Padding(padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Customappbar(title: 'Edit Note',
             icon: Icons.save,
             onPressed:()async{
             saveNote();
             }),
             ///
            TextFormField(
              controller: titleController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hint: Text('Title', style: TextStyle(color: Colors.white)),
                labelText: 'Title',
                prefixIcon: Icon(Icons.title),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            SingleChildScrollView(
              child: TextFormField(
                controller: contentController,
                style: TextStyle(color: Colors.black),
                    maxLines: null,
              keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hint: Text('content', style: TextStyle(color: Colors.white)),
                  labelText: 'content',
                  prefixIcon: Icon(Icons.abc_outlined),
                  border: OutlineInputBorder(),
                  hintMaxLines: 6,
                ),
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: ColorListView(
                initialIndex: kNoteColors.indexOf(selectedColor),
                onColorSelected: (color) {
                  setState(() {
                    selectedColor=color;
                  });
                 

                },
                
                ),
              
            ),
               SizedBox(height: 20,),
              // ElevatedButton(onPressed: ()async{
         // widget.note.title=titleController.text;
          //widget.note.content=contentController.text;
          //widget.note.color=selectedColor.value;
          //await widget.note.save();
          //print(widget.note.title);
          //Navigator.pop(context);
            //   },
              //  child: Text('Save')),
                
          ],
        ),
      ),
      ),
    );
  }
}
 