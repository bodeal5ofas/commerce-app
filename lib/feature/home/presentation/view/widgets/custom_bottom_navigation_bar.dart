import 'package:ecommerce_app/core/utils/mytheme.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar(
      {super.key, required this.currentIndex, this.onTap});
  final int currentIndex;
  final void Function(int)? onTap;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: onTap,
          currentIndex: currentIndex,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          backgroundColor: Mytheme.mainColor,
          // unselectedItemColor: Colors.white,
          //selectedItemColor: Mytheme.mainColor,
          items: [
            BottomNavigationBarItem(
                label: '',
                icon: CircleAvatar(
                    backgroundColor:
                        currentIndex == 0 ? Colors.white : Mytheme.mainColor,
                    foregroundColor:
                        currentIndex == 0 ? Mytheme.mainColor : Colors.white,
                    radius: 18,
                    child: const ImageIcon(
                      AssetImage('assets/images/home.png'),
                      size: 30,
                    ))),
            BottomNavigationBarItem(
                label: '',
                icon: CircleAvatar(
                    backgroundColor:
                        currentIndex == 1 ? Colors.white : Mytheme.mainColor,
                    foregroundColor:
                        currentIndex == 1 ? Mytheme.mainColor : Colors.white,
                    radius: 18,
                    child: const ImageIcon(
                      AssetImage('assets/images/category.png'),
                      size: 30,
                    ))),
            BottomNavigationBarItem(
                label: '',
                icon: CircleAvatar(
                    backgroundColor:
                        currentIndex == 2 ? Colors.white : Mytheme.mainColor,
                    foregroundColor:
                        currentIndex == 2 ? Mytheme.mainColor : Colors.white,
                    radius: 18,
                    child: const ImageIcon(
                      AssetImage('assets/images/heart.png'),
                      size: 30,
                    ))),
            BottomNavigationBarItem(
                label: '',
                icon: CircleAvatar(
                    backgroundColor:
                        currentIndex == 3 ? Colors.white : Mytheme.mainColor,
                    foregroundColor:
                        currentIndex == 3 ? Mytheme.mainColor : Colors.white,
                    radius: 18,
                    child: const Icon(
                      Icons.account_circle_outlined,
                      size: 30,
                    ))),
          ]),
    );
  }
}
