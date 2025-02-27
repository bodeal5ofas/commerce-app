import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key, required this.image, required this.isActive});
  final String image;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: isActive ? Colors.green : Colors.black),
      ),
      child: SvgPicture.asset(
        image,
        fit: BoxFit.fill,
        //height: 10,
      ),
    );
  }
}
