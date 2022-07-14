import 'package:flutter/material.dart';

class MaterialButtonBox extends StatelessWidget {
  final String title;
  final void Function() onTap;

  const MaterialButtonBox({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      MaterialButton(
        color: Colors.lightGreen.shade400,
        onPressed: onTap,
        height: MediaQuery.of(context).size.height*0.09,
        minWidth: MediaQuery.of(context).size.width*0.6,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40)),
        child: Text(title,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 22.0,
              fontWeight: FontWeight.bold
          ),),
      );
  }
}