import 'package:flutter/material.dart';

class ProductIteam extends StatelessWidget {
  const ProductIteam({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),),
      child: Column(children: [
        Stack(children: [
          Image.asset('assets/images/baner1.png')
        ],)
      ],),
    );
  }
}