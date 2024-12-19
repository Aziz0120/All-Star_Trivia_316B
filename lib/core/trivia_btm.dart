import 'package:all_star_trivia_316_b/core/tri_colors.dart';
import 'package:all_star_trivia_316_b/favorite/favorite_screen.dart';
import 'package:all_star_trivia_316_b/goals/goals_screen.dart';
import 'package:all_star_trivia_316_b/legends/legends_screen.dart';
import 'package:all_star_trivia_316_b/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TriviaDownBar extends StatefulWidget {
  const TriviaDownBar({super.key, this.indexScr = 0});
  final int indexScr;

  @override
  State<TriviaDownBar> createState() => _TriviaDownBarState();
}

class _TriviaDownBarState extends State<TriviaDownBar> {
  late int _currentIndex;
  final List<Widget> _pages = const [
    LegendsScreen(),
    FavoriteScreen(),
    GoalsScreen(),
    SettingsScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.indexScr;
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _buildNavItem(int index, String iconPath, String text) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: SizedBox(
        height: 64.h,
        child: Column(
          children: [
            Image.asset(
              iconPath,
              width: 32.w,
              color:
                  _currentIndex == index ? TriColors.tiffany : TriColors.white,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                color: _currentIndex == index
                    ? TriColors.tiffany
                    : TriColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          top: 16.h,
          left: 35.w,
          right: 35.w,
          bottom: 26.h,
        ),
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(0, 'assets/icons/legend.png', 'Legends'),
            _buildNavItem(1, 'assets/icons/fav.png', 'Favorites'),
            _buildNavItem(2, 'assets/icons/goal.png', 'Goals'),
            _buildNavItem(3, 'assets/icons/settings.png', 'Settings'),
          ],
        ),
      ),
    );
  }
}
