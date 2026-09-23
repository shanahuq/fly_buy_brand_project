import 'package:flutter/material.dart';
import 'home_page.dart';
import 'shop_page.dart';
import 'cart_page.dart';
import 'profile_page.dart';

class BottomNavigationbar extends StatefulWidget {
  const BottomNavigationbar({super.key});

  @override
  State<BottomNavigationbar> createState() => _BottomNavigationbarState();
}

class _BottomNavigationbarState extends State<BottomNavigationbar> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    const HomePage(),
    const ShopPage(),
    const CartPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
          child: Container(
            height: 70,

            decoration: BoxDecoration(
              color: const Color(0xff171B22),

              borderRadius: BorderRadius.circular(22),

              border: Border.all(
                color: Colors.white.withOpacity(0.08),
                width: 1,
              ),

              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.35),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem(
                  icon: Icons.home_outlined,
                  activeIcon: Icons.home_rounded,
                  label: 'Home',
                  index: 0,
                ),

                _buildNavItem(
                  icon: Icons.shopping_bag_outlined,
                  activeIcon: Icons.shopping_bag_rounded,
                  label: 'Shop',
                  index: 1,
                ),

                _buildNavItem(
                  icon: Icons.shopping_cart_outlined,
                  activeIcon: Icons.shopping_cart_rounded,
                  label: 'Cart',
                  index: 2,
                ),

                _buildNavItem(
                  icon: Icons.person_outline_rounded,
                  activeIcon: Icons.person_rounded,
                  label: 'Profile',
                  index: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required IconData activeIcon,
    required String label,
    required int index,
  }) {
    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },

      behavior: HitTestBehavior.opaque,

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,

        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),

        decoration: BoxDecoration(
          color:
              isSelected ? Colors.white.withOpacity(0.10) : Colors.transparent,

          borderRadius: BorderRadius.circular(16),

          border:
              isSelected
                  ? Border.all(color: Colors.white.withOpacity(0.08))
                  : null,
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),

              child: Icon(
                isSelected ? activeIcon : icon,

                key: ValueKey(isSelected),

                color:
                    isSelected ? Colors.white : Colors.white.withOpacity(0.45),

                size: 24,
              ),
            ),

            const SizedBox(height: 4),

            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),

              style: TextStyle(
                color:
                    isSelected ? Colors.white : Colors.white.withOpacity(0.45),

                fontSize: 10,

                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              ),

              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }
}
