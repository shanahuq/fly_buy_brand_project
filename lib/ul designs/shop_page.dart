import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // ==========================================================
  // THEME COLORS
  // ==========================================================

  static const Color darkColor = Color(0xff0A0D12);
  static const Color darkSurface = Color(0xff171B22);
  static const Color bronze = Color(0xffB87820);
  static const Color darkBronze = Color(0xff855300);
  static const Color pageBackground = Color(0xffF8F8F7);

  // ==========================================================
  // CATEGORY
  // ==========================================================

  int selectedCategory = 0;

  final List<String> categories = [
    'All Products',
    'E-Cigs',
    'Gadgets',
    'Games & Gifts',
    'Home-Kitchen',
    'KIDS',
    'MEN',
    'WOMEN',
  ];

  // ==========================================================
  // PRODUCTS
  // ==========================================================

  final List<Map<String, dynamic>> products = [
    {
      'image': 'assets/products/bag.jpg',
      'category': 'LEATHER GOODS',
      'name': 'CHANEL CLASSIC FLAP',
      'description': 'Black Lambskin & Gold',
      'price': 24999,
      'oldPrice': 32500,
      'rating': 4.9,
      'reviews': 84,
    },
    {
      'image': 'assets/products/watch.jpg',
      'category': 'TIMEPIECES',
      'name': 'AURORA AUTOMATIC',
      'description': 'Rose Gold - Turquoise Edition',
      'price': 18450,
      'oldPrice': 23500,
      'rating': 5.0,
      'reviews': 52,
    },
    {
      'image': 'assets/products/sunglasses1.jpg',
      'category': 'SUNGLASS',
      'name': 'CARTIER VENDÔME GOLD',
      'description': 'Tortoiseshell & 24K Accent',
      'price': 4999,
      'oldPrice': 7200,
      'rating': 4.8,
      'reviews': 101,
    },
    {
      'image': 'assets/products/sunglasses2.jpg',
      'category': 'SUNGLASS',
      'name': 'PRADA RUNWAY SQUARE',
      'description': 'Gloss Acetate Black',
      'price': 3999,
      'oldPrice': 5500,
      'rating': 4.9,
      'reviews': 120,
    },
    {
      'image': 'assets/products/sunglasses3.jpg',
      'category': 'SUNGLASS',
      'name': 'FBB SIGNATURE BLACK',
      'description': 'Premium Black Acetate',
      'price': 4499,
      'oldPrice': 6000,
      'rating': 4.8,
      'reviews': 78,
    },
    {
      'image': 'assets/products/sunglasses4.jpg',
      'category': 'SUNGLASS',
      'name': 'GUCCI AVIATOR',
      'description': 'Classic Luxury Edition',
      'price': 5299,
      'oldPrice': 6800,
      'rating': 4.9,
      'reviews': 90,
    },
  ];

  // ==========================================================
  // BUILD
  // ==========================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBackground,

      // ========================================================
      // APP BAR
      // ========================================================
      appBar: AppBar(
        backgroundColor: darkColor,
        elevation: 0,
        scrolledUnderElevation: 0,

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
                  fontSize: 23.sp,
                  fontWeight: FontWeight.w700,
                  height: 0.9,
                ),
              ),
              Text(
                'FLYBUYBRAND',
                style: TextStyle(
                  color: Colors.white38,
                  fontSize: 7.sp,
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
            icon: Icon(Icons.search_rounded, color: Colors.white, size: 24.sp),
          ),

          IconButton(
            onPressed: () {
              debugPrint('Shopping bag');
            },
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
              size: 23.sp,
            ),
          ),

          SizedBox(width: 6.w),
        ],
      ),

      // ========================================================
      // BODY
      // ========================================================
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.fromLTRB(16.w, 14.h, 16.w, 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ==================================================
                // PAGE TITLE
                // ==================================================

                // ==================================================
                // PREMIUM SHOP HEADER
                // ==================================================
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 18.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xffEFE8DC), // luxury cream background
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: const Color(0xffE2D8C8)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Text(
                              'PREMIUM SHOP',
                              style: TextStyle(
                                color: darkColor,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.3,
                              ),
                            ),
                          ),

                          Text(
                            '${products.length} Products',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 6.h),

                      Text(
                        'Discover our curated collection of premium products',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 11.sp,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 24.h),

                SizedBox(height: 5.h),

                Text(
                  'Discover our curated collection of premium products',
                  style: TextStyle(color: Colors.black45, fontSize: 12.sp),
                ),

                // ==================================================
                // CATEGORY HEADER
                // ==================================================
                Row(
                  children: [
                    Text(
                      'Shop by Category',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const Spacer(),

                    GestureDetector(
                      onTap: _openFilter,
                      child: Row(
                        children: [
                          Text(
                            'View all',
                            style: TextStyle(
                              color: bronze,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: bronze,
                            size: 10.sp,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 12.h),

                // ==================================================
                // CATEGORIES
                // ==================================================
                _buildCategories(),

                SizedBox(height: 26.h),

                // ==================================================
                // PRODUCT HEADER
                // ==================================================
                Row(
                  children: [
                    Text(
                      selectedCategory == 0
                          ? 'All Products'
                          : categories[selectedCategory],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const Spacer(),

                    _buildFilterButton(),
                  ],
                ),

                SizedBox(height: 12.h),

                // ==================================================
                // PRODUCT GRID
                // ==================================================
                _buildProductGrid(),

                SizedBox(height: 25.h),

                // ==================================================
                // LOAD MORE
                // ==================================================
                _buildLoadMore(),

                SizedBox(height: 30.h),

                // ==================================================
                // TRUST FEATURES
                // ==================================================
                _buildTrustSection(),

                SizedBox(height: 25.h),

                // ==================================================
                // FOOTER
                // ==================================================
                _buildFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // SEARCH BOX
  // ============================================================

  Widget _buildSearchBox() {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        color: darkSurface,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: TextField(
        style: TextStyle(color: Colors.white, fontSize: 13.sp),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintText: 'Search products, designers, collections...',
          hintStyle: TextStyle(color: Colors.white38, fontSize: 11.sp),
          prefixIcon: Icon(
            Icons.search_rounded,
            color: Colors.white54,
            size: 21.sp,
          ),
          suffixIcon: Icon(
            Icons.mic_none_rounded,
            color: Colors.white54,
            size: 19.sp,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 14.h),
        ),
      ),
    );
  }

  // ============================================================
  // CATEGORIES
  // ============================================================

  Widget _buildCategories() {
    return SizedBox(
      height: 42.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final bool selected = selectedCategory == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory = index;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: EdgeInsets.only(right: 8.w),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: selected ? bronze : Colors.white,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: selected ? bronze : Colors.black12),
              ),
              child: Text(
                categories[index],
                style: TextStyle(
                  color: selected ? Colors.white : Colors.black87,
                  fontSize: 11.sp,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // ============================================================
  // FILTER BUTTON
  // ============================================================

  Widget _buildFilterButton() {
    return GestureDetector(
      onTap: _openFilter,
      child: Container(
        height: 36.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: Colors.black12),
        ),
        child: Row(
          children: [
            Icon(Icons.tune_rounded, size: 15.sp, color: Colors.black87),
            SizedBox(width: 5.w),
            Text(
              'Filter',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // PRODUCT GRID
  // ============================================================

  Widget _buildProductGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 0.61,
      ),
      itemBuilder: (context, index) {
        return _buildProductCard(products[index]);
      },
    );
  }

  // ============================================================
  // PRODUCT CARD
  // ============================================================

  Widget _buildProductCard(Map<String, dynamic> product) {
    final int price = product['price'];
    final int oldPrice = product['oldPrice'];

    final int discount = ((oldPrice - price) / oldPrice * 100).round();

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ==================================================
          // IMAGE
          // ==================================================
          AspectRatio(
            aspectRatio: 1.0,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    product['image'],
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: const Color(0xffEEEEEE),
                        child: Icon(
                          Icons.image_outlined,
                          color: Colors.black26,
                          size: 35.sp,
                        ),
                      );
                    },
                  ),
                ),

                // DISCOUNT
                Positioned(
                  top: 8.h,
                  left: 8.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: darkBronze,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Text(
                      'SALE -$discount%',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                // WISHLIST
                Positioned(
                  top: 7.h,
                  right: 7.w,
                  child: GestureDetector(
                    onTap: () {
                      debugPrint('${product['name']} favorite');
                    },
                    child: Container(
                      width: 31.w,
                      height: 31.w,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.favorite_border_rounded,
                        color: Colors.black54,
                        size: 18.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ==================================================
          // DETAILS
          // ==================================================
          Padding(
            padding: EdgeInsets.fromLTRB(10.w, 9.h, 10.w, 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // CATEGORY
                Text(
                  product['category'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: bronze,
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.4,
                  ),
                ),

                SizedBox(height: 4.h),

                // NAME
                Text(
                  product['name'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: 3.h),

                // DESCRIPTION
                Text(
                  product['description'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.black45, fontSize: 9.sp),
                ),

                SizedBox(height: 6.h),

                // RATING
                Row(
                  children: [
                    ...List.generate(5, (index) {
                      return Icon(
                        Icons.star_rounded,
                        color: bronze,
                        size: 11.sp,
                      );
                    }),

                    SizedBox(width: 4.w),

                    Text(
                      '${product['rating']} (${product['reviews']})',
                      style: TextStyle(color: Colors.black45, fontSize: 8.sp),
                    ),
                  ],
                ),

                SizedBox(height: 7.h),

                // PRICE
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '₹${_formatPrice(price)}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    SizedBox(width: 5.w),

                    Flexible(
                      child: Text(
                        '₹${_formatPrice(oldPrice)}',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black26,
                          fontSize: 9.sp,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 8.h),

                // STOCK
                Row(
                  children: [
                    Container(
                      width: 6.w,
                      height: 6.w,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      'In Stock',
                      style: TextStyle(color: Colors.green, fontSize: 8.sp),
                    ),
                  ],
                ),

                SizedBox(height: 9.h),

                // ADD TO CART
                SizedBox(
                  width: double.infinity,
                  height: 36.h,
                  child: ElevatedButton(
                    onPressed: () {
                      debugPrint('${product['name']} added to cart');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: bronze,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_bag_outlined, size: 15.sp),
                        SizedBox(width: 5.w),
                        Text(
                          'Add to Cart',
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // PRICE FORMAT
  // ============================================================

  String _formatPrice(int price) {
    return price.toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (match) => '${match.group(1)},',
    );
  }

  // ============================================================
  // LOAD MORE
  // ============================================================

  Widget _buildLoadMore() {
    return Center(
      child: SizedBox(
        height: 40.h,
        child: OutlinedButton(
          onPressed: () {
            debugPrint('Load more products');
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: bronze,
            side: const BorderSide(color: bronze),
            padding: EdgeInsets.symmetric(horizontal: 26.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: Text(
            'LOAD MORE',
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // TRUST SECTION
  // ============================================================

  Widget _buildTrustSection() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: darkColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          _buildTrustItem(
            Icons.local_shipping_outlined,
            'Free Shipping',
            'Orders over ₹500',
          ),
          _buildTrustItem(Icons.verified_outlined, 'Authentic', '100% genuine'),
          _buildTrustItem(
            Icons.lock_outline_rounded,
            'Secure Pay',
            'Safe checkout',
          ),
          _buildTrustItem(
            Icons.support_agent_rounded,
            'Support',
            'Always here',
          ),
        ],
      ),
    );
  }

  Widget _buildTrustItem(IconData icon, String title, String subtitle) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, color: Colors.white, size: 20.sp),

          SizedBox(height: 6.h),

          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 9.sp,
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 2.h),

          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white38, fontSize: 6.5.sp),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // FOOTER
  // ============================================================

  Widget _buildFooter() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: darkColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'FBB LUXURY',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          ),

          SizedBox(height: 8.h),

          Text(
            'Redefining luxury fashion with carefully '
            'curated collections from world-renowned designers.',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 9.sp,
              height: 1.5,
            ),
          ),

          SizedBox(height: 18.h),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildFooterColumn('SHOP', [
                  'Men Fashion',
                  'Women Fashion',
                  'Accessories',
                  'Footwear',
                  'Watches',
                  'Sunglasses',
                ]),
              ),

              SizedBox(width: 20.w),

              Expanded(
                child: _buildFooterColumn('COMPANY', [
                  'About Us',
                  'Our Story',
                  'Contact Us',
                  'Privacy Policy',
                ]),
              ),
            ],
          ),

          SizedBox(height: 18.h),

          Divider(color: Colors.white12, height: 1),

          SizedBox(height: 12.h),

          Text(
            '© 2026 FBB Luxury. All rights reserved.',
            style: TextStyle(color: Colors.white30, fontSize: 7.sp),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterColumn(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 9.sp,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),

        SizedBox(height: 8.h),

        ...items.map(
          (item) => Padding(
            padding: EdgeInsets.only(bottom: 6.h),
            child: Text(
              item,
              style: TextStyle(color: Colors.white, fontSize: 8.sp),
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // FILTER BOTTOM SHEET
  // ============================================================

  void _openFilter() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: 0.78.sh,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(18.r)),
          ),
          child: Column(
            children: [
              SizedBox(height: 10.h),

              // HANDLE
              Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),

              // HEADER
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 14.h, 10.w, 12.h),
                child: Row(
                  children: [
                    Text(
                      'Filter Products',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const Spacer(),

                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close_rounded, size: 22.sp),
                    ),
                  ],
                ),
              ),

              Divider(height: 1, color: Colors.black12),

              // CATEGORIES
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final bool selected = selectedCategory == index;

                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedCategory = index;
                        });

                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 18.w,
                          vertical: 16.h,
                        ),
                        decoration: BoxDecoration(
                          color:
                              selected
                                  ? bronze.withOpacity(0.08)
                                  : Colors.white,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                categories[index],
                                style: TextStyle(
                                  color: selected ? bronze : Colors.black87,
                                  fontSize: 13.sp,
                                  fontWeight:
                                      selected
                                          ? FontWeight.w600
                                          : FontWeight.w400,
                                ),
                              ),
                            ),

                            Icon(
                              selected
                                  ? Icons.check_rounded
                                  : Icons.arrow_forward_ios_rounded,
                              color: selected ? bronze : Colors.black26,
                              size: selected ? 19.sp : 12.sp,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
