// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:d_note_app/model/note_model.dart';
import 'package:d_note_app/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    Key? key,
    required this.note,
    this.onDelete,
  }) : super(key: key);
  final NoteModel note;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
  
    return GestureDetector(
      onTap: () {
        Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => EditNoteView(
      note: note,
    ),
  ),
);
      },
      child: Card(
        color: Color(note.color),
        elevation: .5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                   Expanded(
                    child: Text(
                      note.title,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: onDelete,
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.black,
                      size: 28,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                note.content,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 24),
               Align(
                alignment: Alignment.centerRight,
                child: Text(
                   DateFormat('MMM d,yyyy').format(note.date),
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
