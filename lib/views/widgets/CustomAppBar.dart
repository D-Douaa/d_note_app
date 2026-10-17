import 'package:flutter/material.dart';
class Customappbar extends StatelessWidget {
  const Customappbar({super.key, required this.title, required this.icon, this.onPressed});
final String title;
final IconData icon;
 final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsetsGeometry.only(top: 16, bottom: 24),
    child: Row(children: [
      Text(title,style: TextStyle(fontSize: 28,
              fontWeight: FontWeight.bold),),
              Spacer(),
              Container(width: 46,
            height: 46,
            decoration: BoxDecoration(color: Colors.white.withOpacity(.5),
            borderRadius: BorderRadius.circular(12)),
            child: IconButton(
              onPressed: onPressed,
               icon: Icon(icon)),
            ),
            
    ],),);
  }
}