import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fly_buy_brand_project/ul%20designs/check_out_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // ==========================================================
  // THEME COLORS
  // ==========================================================

  static const Color darkColor = Color(0xff0A0D12);
  static const Color darkSurface = Color(0xff171B22);
  static const Color bronze = Color(0xffB87820);
  static const Color darkBronze = Color(0xff855300);
  static const Color pageBackground = Color(0xffF8F8F7);
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
    final formatted = value.round().toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (match) => '${match.group(1)},',
    );

    return '₹$formatted';
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
          // PRODUCT IMAGE
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
                  alignment: Alignment.center,
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

          // PRODUCT DETAILS
          // Flexible height: the Column can grow as needed.
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['category'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: bronze,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                  ),
                ),

                SizedBox(height: 3.h),

                Text(
                  product['name'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: darkColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                  ),
                ),

                SizedBox(height: 3.h),

                Text(
                  product['description'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: textGrey,
                    fontSize: 10.sp,
                    height: 1.2,
                  ),
                ),

                SizedBox(height: 6.h),

                Row(
                  mainAxisSize: MainAxisSize.min,
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

                    Flexible(
                      child: Text(
                        'In Stock',
                        style: TextStyle(
                          color: stockGreen,
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 8.h),

                // QUANTITY CONTROLS
                Container(
                  constraints: BoxConstraints(minHeight: 28.h, maxWidth: 82.w),
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: const Color(0xffD8D2C9)),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildQuantityButton(
                        icon: Icons.remove,
                        onTap: () {
                          setState(() {
                            if (product['quantity'] > 1) {
                              product['quantity']--;
                            }
                          });
                        },
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Text(
                          '${product['quantity']}',
                          style: TextStyle(
                            color: darkColor,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      _buildQuantityButton(
                        icon: Icons.add,
                        onTap: () {
                          setState(() {
                            product['quantity']++;
                          });
                        },
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 3.h),
              ],
            ),
          ),

          SizedBox(width: 7.w),

          // PRICE AND REMOVE BUTTON
          SizedBox(
            width: 68.w,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      cartItems.removeAt(index);
                    });
                  },
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(minWidth: 25.w, minHeight: 25.w),
                  visualDensity: VisualDensity.compact,
                  icon: Icon(
                    Icons.close_rounded,
                    color: lightGrey,
                    size: 17.sp,
                  ),
                ),

                SizedBox(height: 8.h),

                Text(
                  _price(product['price']),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: darkColor,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                SizedBox(height: 3.h),

                Text(
                  _price(product['oldPrice']),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: lightGrey,
                    fontSize: 9.sp,
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

  Widget _buildQuantityButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(5.r),
      child: SizedBox(
        width: 19.w,
        height: 27.h,
        child: Icon(icon, size: 13.sp, color: textGrey),
      ),
    );
  }

  // ==========================================================
  // BENEFIT CARD
  // FIX: Removed the fixed height that caused the overflow.
  // ==========================================================

  Widget _buildBenefitCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Expanded(
      child: Container(
        constraints: BoxConstraints(minHeight: 105.h),
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: const Color(0xffECE8E2)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 27.w,
              height: 27.w,
              decoration: BoxDecoration(
                color: softCream,
                borderRadius: BorderRadius.circular(7.r),
              ),
              child: Icon(icon, color: bronze, size: 15.sp),
            ),

            SizedBox(height: 7.h),

            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: darkColor,
                fontSize: 11.sp,
                fontWeight: FontWeight.w600,
                height: 1.2,
              ),
            ),

            SizedBox(height: 4.h),

            Text(
              subtitle,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: textGrey, fontSize: 9.sp, height: 1.3),
            ),
          ],
        ),
      ),
    );
  }

  // ==========================================================
  // SUMMARY ROW
  // ==========================================================

  Widget _buildSummaryRow(String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(color: textGrey, fontSize: 12.sp),
          ),
        ),

        SizedBox(width: 8.w),

        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: TextStyle(
              color: darkColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  // ==========================================================
  // ORDER SUMMARY
  // ==========================================================

  Widget _buildOrderSummary() {
    final double subtotal = _calculateSubtotal();

    final double shipping = subtotal >= 5000 ? 0 : 100;

    // Example tax calculation. Adjust for your actual tax rules.
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
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Order Summary',
                  style: TextStyle(
                    color: darkColor,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              Text(
                'INR (₹)',
                style: TextStyle(color: textGrey, fontSize: 11.sp),
              ),
            ],
          ),

          SizedBox(height: 15.h),

          _buildSummaryRow(
            'Subtotal (${cartItems.length} items)',
            _price(subtotal),
          ),

          SizedBox(height: 10.h),

          Row(
            children: [
              Expanded(
                child: Text(
                  'Estimated Shipping',
                  style: TextStyle(color: textGrey, fontSize: 12.sp),
                ),
              ),

              Text(
                shipping == 0 ? 'FREE' : _price(shipping),
                style: TextStyle(
                  color: shipping == 0 ? stockGreen : textGrey,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          SizedBox(height: 10.h),

          _buildSummaryRow('Estimated Tax', _price(tax)),

          SizedBox(height: 12.h),

          const Divider(color: Color(0xffE7E2DB), height: 1),

          SizedBox(height: 12.h),

          Row(
            children: [
              Text(
                'Total',
                style: TextStyle(
                  color: darkColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const Spacer(),

              Flexible(
                child: Text(
                  _price(total),
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: darkColor,
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 5.h),

          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Inclusive of all local duties',
              textAlign: TextAlign.right,
              style: TextStyle(color: lightGrey, fontSize: 9.sp),
            ),
          ),

          SizedBox(height: 14.h),

         SizedBox(
  width: double.infinity,
  height: 44.h,
  child: ElevatedButton(
    onPressed: cartItems.isEmpty
        ? null
        : () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CheckOutPage(),
              ),
            );
          },
    style: ElevatedButton.styleFrom(
      backgroundColor: bronze,
      foregroundColor: Colors.white,
      disabledBackgroundColor: Colors.black12,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
    ),
    child: FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.lock_outline_rounded, size: 15.sp),
          SizedBox(width: 7.w),
          Text(
            'PROCEED TO CHECKOUT',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    ),
  ),
),

          SizedBox(height: 10.h),

          Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 4.w,
              children: [
                Icon(Icons.shield_outlined, color: textGrey, size: 12.sp),

                Text(
                  'Secure end-to-end encrypted checkout',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: textGrey, fontSize: 9.sp),
                ),
              ],
            ),
          ),

          SizedBox(height: 12.h),

          Center(
            child: GestureDetector(
              onTap: () {
                debugPrint('Continue Shopping');
              },
              child: Text(
                '← Continue Shopping',
                style: TextStyle(
                  color: darkBronze,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // BOTTOM NAVIGATION
  // ==========================================================

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required bool selected,
  }) {
    return Expanded(
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: selected ? const Color(0xff30343B) : Colors.transparent,
            borderRadius: BorderRadius.circular(22.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 17.sp,
                color: selected ? Colors.white : Colors.white54,
              ),

              SizedBox(height: 2.h),

              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    label,
                    style: TextStyle(
                      color: selected ? Colors.white : Colors.white54,
                      fontSize: 9.sp,
                      fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                    ),
                  ),
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
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.fromLTRB(25.w, 40.h, 25.w, 110.h),
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: 300.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 75.w,
              height: 75.w,
              decoration: const BoxDecoration(
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
              textAlign: TextAlign.center,
              style: TextStyle(
                color: darkColor,
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
              ),
            ),

            SizedBox(height: 8.h),

            Text(
              'Discover our premium collection and find something you love.',
              textAlign: TextAlign.center,
              style: TextStyle(color: textGrey, fontSize: 13.sp, height: 1.5),
            ),

            SizedBox(height: 20.h),

            SizedBox(
              height: 42.h,
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
                    fontSize: 12.sp,
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
  // APP BAR
  // ==========================================================

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
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
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'FBB',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                height: 1,
              ),
            ),

            Text(
              'FLYBUYBRAND',
              style: TextStyle(
                color: Colors.white38,
                fontSize: 8.sp,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            debugPrint('Search');
          },
          icon: Icon(Icons.search_rounded, color: Colors.white, size: 23.sp),
        ),

        IconButton(
          onPressed: () {
            debugPrint('Shopping bag');
          },
          icon: Icon(
            Icons.shopping_bag_outlined,
            color: Colors.white,
            size: 22.sp,
          ),
        ),

        SizedBox(width: 5.w),
      ],
    );
  }

  // ==========================================================
  // MAIN BUILD
  // ==========================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBackground,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          // MAIN SCROLLABLE CONTENT
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
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // HEADER
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Text(
                                  'Shopping Cart',
                                  style: TextStyle(
                                    color: darkColor,
                                    fontSize: 23.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),

                              SizedBox(width: 8.w),

                              Text(
                                '${cartItems.length} Items',
                                style: TextStyle(
                                  color: textGrey,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 10.h),

                          const Divider(color: borderColor, height: 1),

                          SizedBox(height: 12.h),

                          // CART ITEMS
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
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ...List.generate(
                                  cartItems.length,
                                  (index) => _buildCartItem(index),
                                ),

                                SizedBox(height: 4.h),

                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton.icon(
                                    onPressed: () {
                                      setState(() {
                                        cartItems.clear();
                                      });
                                    },
                                    style: TextButton.styleFrom(
                                      foregroundColor: textGrey,
                                      backgroundColor: softCream,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 9.w,
                                        vertical: 5.h,
                                      ),
                                      minimumSize: Size.zero,
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    icon: Icon(
                                      Icons.delete_sweep_outlined,
                                      size: 15.sp,
                                    ),
                                    label: Text(
                                      'Clear Cart',
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 12.h),

                          // BENEFITS ROW 1
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
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

                          // BENEFITS ROW 2
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
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

                          SizedBox(height: 14.h),

                          // ORDER SUMMARY
                          _buildOrderSummary(),

                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
          ),

          // FIXED BOTTOM NAVIGATION
        ],
      ),
    );
  }
}
