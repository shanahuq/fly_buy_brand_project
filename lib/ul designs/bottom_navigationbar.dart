
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'shop_page.dart';
import 'cart_page.dart';
import 'profile_page.dart';

class BottomNavigationbar extends StatefulWidget {
  final int initialIndex;

  const BottomNavigationbar({
    super.key,
    this.initialIndex = 0,
  });

  @override
  State<BottomNavigationbar> createState() => _BottomNavigationbarState();
}

class _BottomNavigationbarState extends State<BottomNavigationbar> {
  late int selectedIndex;

  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();

    selectedIndex = widget.initialIndex;

    pages = [
      HomePage(
        onShopTap: () {
          setState(() {
            selectedIndex = 1;
          });
        },
      ),

      const ShopPage(),

      const CartPage(),

      const ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 8, 40, 12),

          child: Container(
            height: 62,

            decoration: BoxDecoration(
              color: const Color(0xff171B22),

              borderRadius: BorderRadius.circular(32),

              border: Border.all(
                color: Colors.white.withOpacity(0.08),
                width: 1,
              ),

              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.30),
                  blurRadius: 15,
                  offset: const Offset(0, 6),
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

        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 6,
        ),

        decoration: BoxDecoration(
          color: isSelected
              ? Colors.white.withOpacity(0.10)
              : Colors.transparent,

          borderRadius: BorderRadius.circular(14),

          border: isSelected
              ? Border.all(
                  color: Colors.white.withOpacity(0.08),
                )
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

                color: isSelected
                    ? Colors.white
                    : Colors.white.withOpacity(0.45),

                size: 21,
              ),
            ),

            const SizedBox(height: 2),

            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),

              style: TextStyle(
                color: isSelected
                    ? Colors.white
                    : Colors.white.withOpacity(0.45),

                fontSize: 9,

                fontWeight: isSelected
                    ? FontWeight.w700
                    : FontWeight.w500,
              ),

              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }
}

