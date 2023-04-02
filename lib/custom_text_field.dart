import 'package:flutter/material.dart';

class CustomTextfiled extends StatelessWidget {
  CustomTextfiled(
      {super.key,
      required this.hintText,
      required this.addIcon,
      required this.title, required this.myControl,  this.maxLines = 1});
  final String hintText;
  final IconData addIcon;
   String title;
  final TextEditingController myControl;
  final int maxLines;

 
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: myControl,
      onChanged: (value) {
        title = value;
      },
      maxLines:maxLines ,
      
      decoration: InputDecoration(
          enabledBorder: customOutLIneInputBorder(),
          focusedBorder: customOutLIneInputBorder(),
          hintText: hintText,
          
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Opacity(
              opacity: .8,
              child: Icon(
                addIcon,
                size: 22,
              ),
            ),
          )),
    );
  }

  OutlineInputBorder customOutLIneInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.white));
  }
}
