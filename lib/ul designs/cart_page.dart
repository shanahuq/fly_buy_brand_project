import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // ==========================================================
  // FBB THEME
  // ==========================================================

  static const Color darkColor = Color(0xff0A0D12);
  static const Color darkSurface = Color(0xff171B22);

  static const Color bronze = Color(0xffB87820);
  static const Color darkBronze = Color(0xff855300);

  static const Color pageBackground = Color(0xffF8F8F7);

  static const Color cream = Color(0xffEFE8DC);
  static const Color softCream = Color(0xffF3EEE6);

  static const Color borderColor = Color(0xffE2D8C8);

  static const Color textGrey = Color(0xff77716A);
  static const Color lightGrey = Color(0xffA39B91);

  static const Color stockGreen = Color(0xff3EAD58);

  // ==========================================================
  // CART DATA
  // ==========================================================

  final List<Map<String, dynamic>> cartItems = [
    {
      'category': 'WOMEN',
      'name': 'CHANEL CLASSIC FLAP',
      'description': 'Black Lambskin & Gold',
      'price': 24999,
      'oldPrice': 32500,
      'image': 'assets/leather_goods_image.jpg',
      'quantity': 1,
    },
    {
      'category': 'MEN',
      'name': 'AURORA AUTOMATIC',
      'description': 'Rose Gold - Turquoise',
      'price': 18450,
      'oldPrice': 23500,
      'image': 'assets/timepieces_image.jpg',
      'quantity': 1,
    },
    {
      'category': 'MEN',
      'name': 'CARTIER VENDÔME GOLD',
      'description': 'Tortoiseshell & 24K Accent',
      'price': 4999,
      'oldPrice': 7200,
      'image': 'assets/cartier_sunglass.jpg',
      'quantity': 1,
    },
  ];

  // ==========================================================
  // PRICE CALCULATION
  // ==========================================================

  double _calculateSubtotal() {
    double total = 0;

    for (final product in cartItems) {
      total += (product['price'] as num) * (product['quantity'] as num);
    }

    return total;
  }

  String _price(num value) {
    return '₹${value.toStringAsFixed(0)}';
  }

  // ==========================================================
  // CART ITEM
  // ==========================================================

  Widget _buildCartItem(int index) {
    final product = cartItems[index];

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.only(bottom: 12.h),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xffEAE5DD), width: 1)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ====================================================
          // IMAGE
          // ====================================================
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.asset(
              product['image'],
              width: 70.w,
              height: 70.w,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 70.w,
                  height: 70.w,
                  color: softCream,
                  child: Icon(
                    Icons.image_outlined,
                    color: textGrey,
                    size: 22.sp,
                  ),
                );
              },
            ),
          ),

          SizedBox(width: 10.w),

          // ====================================================
          // PRODUCT DETAILS
          // ====================================================
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // CATEGORY
                Text(
                  product['category'],
                  style: TextStyle(
                    color: bronze,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                  ),
                ),

                SizedBox(height: 2.h),

                // PRODUCT NAME
                Text(
                  product['name'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: darkColor,
                    fontSize: 16.5.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                SizedBox(height: 2.h),

                // DESCRIPTION
                Text(
                  product['description'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: textGrey, fontSize: 13.5.sp),
                ),

                SizedBox(height: 4.h),

                // STOCK
                Row(
                  children: [
                    Container(
                      width: 5.w,
                      height: 5.w,
                      decoration: const BoxDecoration(
                        color: stockGreen,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      'In Stock',
                      style: TextStyle(
                        color: stockGreen,
                        fontSize: 12.5.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 6.h),

                // QUANTITY + WISHLIST
                Row(
                  children: [
                    Container(
                      height: 25.h,
                      width: 58.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: const Color(0xffD8D2C9)),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (product['quantity'] > 1) {
                                  product['quantity']--;
                                }
                              });
                            },
                            child: Text(
                              '−',
                              style: TextStyle(
                                color: textGrey,
                                fontSize: 17.sp,
                              ),
                            ),
                          ),

                          Text(
                            '${product['quantity']}',
                            style: TextStyle(
                              color: darkColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              setState(() {
                                product['quantity']++;
                              });
                            },
                            child: Text(
                              '+',
                              style: TextStyle(
                                color: textGrey,
                                fontSize: 17.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(width: 8.w),

                    Icon(
                      Icons.favorite_border_rounded,
                      color: textGrey,
                      size: 15.sp,
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(width: 5.w),

          // ====================================================
          // PRICE + DELETE
          // ====================================================
          SizedBox(
            width: 65.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      cartItems.removeAt(index);
                    });
                  },
                  child: Icon(
                    Icons.close_rounded,
                    color: lightGrey,
                    size: 14.sp,
                  ),
                ),

                SizedBox(height: 20.h),

                Text(
                  _price(product['price']),
                  style: TextStyle(
                    color: darkColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                SizedBox(height: 2.h),

                Text(
                  _price(product['oldPrice']),
                  style: TextStyle(
                    color: lightGrey,
                    fontSize: 12.5.sp,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // BENEFIT CARD
  // ==========================================================

  Widget _buildBenefitCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Expanded(
      child: Container(
        height: 120.h,
        padding: EdgeInsets.all(9.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: const Color(0xffECE8E2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 25.w,
              height: 25.w,
              decoration: BoxDecoration(
                color: softCream,
                borderRadius: BorderRadius.circular(7.r),
              ),
              child: Icon(icon, color: bronze, size: 14.sp),
            ),

            SizedBox(height: 5.h),

            Text(
              title,
              style: TextStyle(
                color: darkColor,
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: 1.h),

            Text(
              subtitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: textGrey,
                fontSize: 11.8.sp,
                height: 1.15,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==========================================================
  // ORDER SUMMARY
  // ==========================================================

  Widget _buildOrderSummary() {
    final double subtotal = _calculateSubtotal();

    // FREE SHIPPING ABOVE ₹5000
    final double shipping = subtotal >= 5000 ? 0 : 100;

    // Example GST calculation
    final double tax = subtotal * 0.18;

    final double total = subtotal + shipping + tax;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xffECE8E2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TITLE
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order Summary',
                style: TextStyle(
                  color: darkColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),

              Text(
                'INR (₹)',
                style: TextStyle(color: textGrey, fontSize: 12.sp),
              ),
            ],
          ),

          SizedBox(height: 14.h),

          // SUBTOTAL
          _buildSummaryRow(
            'Subtotal (${cartItems.length} items)',
            _price(subtotal),
          ),

          SizedBox(height: 9.h),

          // SHIPPING
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Estimated Shipping',
                style: TextStyle(color: textGrey, fontSize: 14.sp),
              ),

              Text(
                shipping == 0 ? 'FREE' : _price(shipping),
                style: TextStyle(
                  color: shipping == 0 ? stockGreen : textGrey,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          SizedBox(height: 9.h),

          // TAX
          _buildSummaryRow('Estimated Tax', _price(tax.round())),

          SizedBox(height: 10.h),

          const Divider(color: Color(0xffE7E2DB), height: 1),

          SizedBox(height: 10.h),

          // TOTAL
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(
                  color: darkColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),

              Text(
                _price(total.round()),
                style: TextStyle(
                  color: darkColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),

          SizedBox(height: 2.h),

          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Inclusive of all local duties',
              style: TextStyle(color: lightGrey, fontSize: 11.5.sp),
            ),
          ),

          SizedBox(height: 12.h),

          // CHECKOUT BUTTON
          SizedBox(
            width: double.infinity,
            height: 40.h,
            child: ElevatedButton(
              onPressed: () {
                debugPrint('Proceed to Checkout');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: bronze,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.lock_outline_rounded, size: 13.sp),

                  SizedBox(width: 6.w),

                  Text(
                    'PROCEED TO CHECKOUT',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.3,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 9.h),

          // SECURE CHECKOUT
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.shield_outlined, color: textGrey, size: 10.sp),

                SizedBox(width: 4.w),

                Text(
                  'Secure end-to-end encrypted checkout',
                  style: TextStyle(color: textGrey, fontSize: 12.sp),
                ),
              ],
            ),
          ),

          SizedBox(height: 10.h),

          // CONTINUE SHOPPING
          Center(
            child: GestureDetector(
              onTap: () {
                debugPrint('Continue Shopping');
              },
              child: Text(
                '← Continue Shopping',
                style: TextStyle(
                  color: darkBronze,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(color: textGrey, fontSize: 14.sp)),

        Text(
          value,
          style: TextStyle(
            color: darkColor,
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  // ==========================================================
  // BOTTOM NAVIGATION
  // ==========================================================

  Widget _buildBottomNavigation() {
    return Positioned(
      left: 18.w,
      right: 18.w,
      bottom: 12.h,
      child: Container(
        height: 58.h,
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
        decoration: BoxDecoration(
          color: darkSurface,
          borderRadius: BorderRadius.circular(30.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.20),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            _buildNavItem(
              icon: Icons.home_outlined,
              label: 'Home',
              selected: false,
            ),

            _buildNavItem(
              icon: Icons.shopping_bag_outlined,
              label: 'Shop',
              selected: false,
            ),

            _buildNavItem(
              icon: Icons.shopping_cart_outlined,
              label: 'Cart',
              selected: true,
            ),

            _buildNavItem(
              icon: Icons.person_outline_rounded,
              label: 'Profile',
              selected: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required bool selected,
  }) {
    return Expanded(
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: selected ? const Color(0xff30343B) : Colors.transparent,
            borderRadius: BorderRadius.circular(22.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 17.sp,
                color: selected ? Colors.white : Colors.white54,
              ),

              SizedBox(height: 2.h),

              Text(
                label,
                style: TextStyle(
                  color: selected ? Colors.white : Colors.white54,
                  fontSize: 12.sp,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ==========================================================
  // EMPTY CART
  // ==========================================================

  Widget _buildEmptyCart() {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 80.h),
        child: Column(
          children: [
            Container(
              width: 75.w,
              height: 75.w,
              decoration: BoxDecoration(
                color: softCream,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.shopping_cart_outlined,
                color: bronze,
                size: 34.sp,
              ),
            ),

            SizedBox(height: 18.h),

            Text(
              'Your Cart is Empty',
              style: TextStyle(
                color: darkColor,
                fontSize: 23.sp,
                fontWeight: FontWeight.w700,
              ),
            ),

            SizedBox(height: 7.h),

            Text(
              'Discover our premium collection and find something you love.',
              textAlign: TextAlign.center,
              style: TextStyle(color: textGrey, fontSize: 14.sp, height: 1.4),
            ),

            SizedBox(height: 18.h),

            SizedBox(
              height: 40.h,
              child: ElevatedButton(
                onPressed: () {
                  debugPrint('Start Shopping');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: bronze,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Text(
                  'START SHOPPING',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.4,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==========================================================
  // BUILD
  // ==========================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBackground,

      // ======================================================
      // APP BAR
      // ======================================================
      appBar: AppBar(
        backgroundColor: darkColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        leadingWidth: 100.w,

        leading: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'FBB',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w700,
                  height: 0.9,
                ),
              ),

              Text(
                'FLYBUYBRAND',
                style: TextStyle(
                  color: Colors.white38,
                  fontSize: 12.sp,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),

        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search_rounded, color: Colors.white, size: 24.sp),
          ),

          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
              size: 23.sp,
            ),
          ),

          SizedBox(width: 5.w),
        ],
      ),

      // ======================================================
      // BODY
      // ======================================================
      body: Stack(
        children: [
          SafeArea(
            top: false,
            child:
                cartItems.isEmpty
                    ? _buildEmptyCart()
                    : SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.fromLTRB(16.w, 14.h, 16.w, 100.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ====================================
                          // HEADER
                          // ====================================
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Shopping Cart',
                                style: TextStyle(
                                  color: darkColor,
                                  fontSize: 26.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),

                              Text(
                                '${cartItems.length} Items',
                                style: TextStyle(
                                  color: textGrey,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 8.h),

                          const Divider(color: borderColor, height: 1),

                          SizedBox(height: 12.h),

                          // ====================================
                          // CART ITEMS CARD
                          // ====================================
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.fromLTRB(10.w, 12.h, 10.w, 9.h),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(
                                color: const Color(0xffECE8E2),
                              ),
                            ),
                            child: Column(
                              children: [
                                ...List.generate(
                                  cartItems.length,
                                  (index) => _buildCartItem(index),
                                ),

                                SizedBox(height: 2.h),

                                // CLEAR CART
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        cartItems.clear();
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 9.w,
                                        vertical: 6.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: softCream,
                                        borderRadius: BorderRadius.circular(
                                          7.r,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.delete_sweep_outlined,
                                            color: textGrey,
                                            size: 11.sp,
                                          ),

                                          SizedBox(width: 4.w),

                                          Text(
                                            'Clear Cart',
                                            style: TextStyle(
                                              color: textGrey,
                                              fontSize: 12.5.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 12.h),

                          // ====================================
                          // BENEFITS ROW 1
                          // ====================================
                          Row(
                            children: [
                              _buildBenefitCard(
                                icon: Icons.verified_user_outlined,
                                title: 'Secure Payment',
                                subtitle:
                                    '256-bit encrypted checkout guarantee.',
                              ),

                              SizedBox(width: 8.w),

                              _buildBenefitCard(
                                icon: Icons.local_shipping_outlined,
                                title: 'Free Shipping',
                                subtitle: 'Complimentary express shipping.',
                              ),
                            ],
                          ),

                          SizedBox(height: 8.h),

                          // ====================================
                          // BENEFITS ROW 2
                          // ====================================
                          Row(
                            children: [
                              _buildBenefitCard(
                                icon: Icons.replay_rounded,
                                title: 'Easy Returns',
                                subtitle: '30-day hassle-free returns.',
                              ),

                              SizedBox(width: 8.w),

                              _buildBenefitCard(
                                icon: Icons.workspace_premium_outlined,
                                title: 'Authentic',
                                subtitle: '100% genuine products.',
                              ),
                            ],
                          ),

                          SizedBox(height: 12.h),

                          // ====================================
                          // ORDER SUMMARY
                          // ====================================
                          _buildOrderSummary(),
                        ],
                      ),
                    ),
          ),

        
        ],
      ),
    );
  }
}
