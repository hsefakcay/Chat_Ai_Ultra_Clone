import 'package:chat_ai_ultra_clone/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/string_constants.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int)? onTap;

  const BottomNavBar({super.key, required this.currentIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        border: Border(top: BorderSide(color: ColorConstants.backgroundSecondary, width: 0.3)),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          currentIndex: currentIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey[500],
          selectedFontSize: 14,
          unselectedFontSize: 14,
          iconSize: 28,
          type: BottomNavigationBarType.fixed,
          onTap: onTap,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.explore), label: StringConstants.explore),
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_view_rounded),
              label: StringConstants.home,
            ),
            BottomNavigationBarItem(icon: Icon(Icons.chat_rounded), label: StringConstants.chats),
          ],
        ),
      ),
    );
  }
}
