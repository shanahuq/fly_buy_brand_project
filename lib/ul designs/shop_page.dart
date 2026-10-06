import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Category {
  final String name;
  final List<String> subcategories;

  const Category({required this.name, this.subcategories = const []});

  bool get hasSubcategories => subcategories.isNotEmpty;
}

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

  int selectedCategoryIndex = 0;
  String? selectedSubcategory;

  final List<Category> categories = [
    // ==========================================================
    // ALL PRODUCTS
    // ==========================================================
    Category(name: 'All Products'),

    // ==========================================================
    // E-CIGS
    // ==========================================================
    Category(name: 'E-Cigs', subcategories: ['Vape']),

    // ==========================================================
    // GADGETS
    // ==========================================================
    Category(
      name: 'Gadgets',
      subcategories: [
        // Add gadget subcategories here later
      ],
    ),

    // ==========================================================
    // GAMES & GIFTS
    // ==========================================================
    Category(
      name: 'Games & Gifts',
      subcategories: [
        // Add game/gift subcategories here later
      ],
    ),

    // ==========================================================
    // HOME-KITCHEN
    // ==========================================================
    Category(
      name: 'Home-Kitchen',
      subcategories: ['Bedsheets', 'Home Appliance'],
    ),

    // ==========================================================
    // KIDS
    // ==========================================================
    Category(name: 'KIDS', subcategories: ['Footware']),

    // ==========================================================
    // MEN
    // ==========================================================
    Category(
      name: 'MEN',
      subcategories: [
        'Exclusive Watches',
        'Footware',
        'Outfits',
        'Perfume',
        'Perfume & Jewellers',
        'Premium-Shirts',
        'Shoes For men',
        'Sunglass & Frames',
        'Wallet & Belts',
        'Watches',
      ],
    ),

    // ==========================================================
    // WOMEN
    // ==========================================================
    Category(
      name: 'WOMEN',
      subcategories: [
        'Bags & Backpacks',
        'Cosmetics',
        'Footware',
        'Outfits',
        'PARDHA',
        'Perfume',
        'jewellers',
      ],
    ),
  ];

  // ==========================================================
  // PRODUCTS
  // ==========================================================

  final List<Map<String, dynamic>> products = [
    {
      'image': 'assets/leather_goods_image.jpg',
      'category': 'WOMEN',
      'subcategory': 'Bags & Backpacks',
      'name': 'CHANEL CLASSIC FLAP',
      'description': 'Black Lambskin & Gold',
      'price': 24999,
      'oldPrice': 32500,
      'rating': 4.9,
      'reviews': 84,
    },
    {
      'image': 'assets/timepieces_image.jpg',
      'category': 'Home-Kitchen',
      'subcategory': 'Home Appliance',

      'name': 'AURORA AUTOMATIC',
      'description': 'Rose Gold - Turquoise Edition',
      'price': 18450,
      'oldPrice': 23500,
      'rating': 5.0,
      'reviews': 52,
    },
    {
      'image': 'assets/cartier_sunglass.jpg',
      'category': 'MEN',
      'subcategory': 'Sunglass & Frames',

      'name': 'CARTIER VENDÔME GOLD',
      'description': 'Tortoiseshell & 24K Accent',
      'price': 4999,
      'oldPrice': 7200,
      'rating': 4.8,
      'reviews': 101,
    },
    {
      'image': 'assets/prada_sunglass.jpg',
      'category': 'MEN',
      'subcategory': 'Sunglass & Frames',

      'name': 'PRADA RUNWAY SQUARE',
      'description': 'Gloss Acetate Black',
      'price': 3999,
      'oldPrice': 5500,
      'rating': 4.9,
      'reviews': 120,
    },
    {
      'image': 'assets/sunglasses_image.jpg',
      'category': 'MEN',
      'subcategory': 'Sunglass & Frames',

      'name': 'FBB SIGNATURE BLACK',
      'description': 'Premium Black Acetate',
      'price': 4499,
      'oldPrice': 6000,
      'rating': 4.8,
      'reviews': 78,
    },
    {
      'image': 'assets/gucci_sunglass.jpg',
      'category': 'MEN',
      'subcategory': 'Sunglass & Frames',

      'name': 'GUCCI AVIATOR',
      'description': 'Classic Luxury Edition',
      'price': 5299,
      'oldPrice': 6800,
      'rating': 4.9,
      'reviews': 90,
    },
  ];

  List<Map<String, dynamic>> get filteredProducts {
    // ALL PRODUCTS
    if (selectedCategoryIndex == 0) {
      return products;
    }

    final String selectedCategory = categories[selectedCategoryIndex].name;

    // CATEGORY + SUBCATEGORY
    if (selectedSubcategory != null) {
      return products.where((product) {
        return product['category'] == selectedCategory &&
            product['subcategory'] == selectedSubcategory;
      }).toList();
    }

    // CATEGORY ONLY
    return products.where((product) {
      return product['category'] == selectedCategory;
    }).toList();
  }

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

                // ==================================================
                // CATEGORY HEADER
                // ==================================================
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

                    _buildFilterButton(),
                  ],
                ),

                SizedBox(height: 14.h),

                // ==================================================
                // HORIZONTAL CATEGORIES
                // ==================================================
                _buildCategories(),

                SizedBox(height: 26.h),

                // ==================================================
                // PRODUCT HEADER
                // ==================================================
                Row(
                  children: [
                    Text(
                      selectedSubcategory != null
                          ? selectedSubcategory!
                          : categories[selectedCategoryIndex].name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const Spacer(),

                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategoryIndex = 0;
                          selectedSubcategory = null;
                        });
                      },
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
                SizedBox(height: 25.h),

                // ==================================================
                // FOOTER
                // ==================================================
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // CATEGORIES
  // ============================================================

  // ============================================================
  // CATEGORY SELECTOR
  // ============================================================

  Widget _buildCategories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ======================================================
        // MAIN CATEGORIES - HORIZONTAL
        // ======================================================
        SizedBox(
          height: 44.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: categories.length,
            separatorBuilder: (context, index) {
              return SizedBox(width: 8.w);
            },
            itemBuilder: (context, index) {
              final category = categories[index];
              final bool selected = selectedCategoryIndex == index;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCategoryIndex = index;
                    selectedSubcategory = null;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    color: selected ? bronze : Colors.white,
                    borderRadius: BorderRadius.circular(22.r),
                    border: Border.all(
                      color: selected ? bronze : Colors.black12,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        category.name,
                        style: TextStyle(
                          color:
                              selected
                                  ? Colors.white
                                  : const Color.fromARGB(255, 0, 0, 0),
                          fontSize: 11.sp,
                          fontWeight:
                              selected ? FontWeight.w600 : FontWeight.w400,
                        ),
                      ),

                      // Small arrow if category has subcategories
                      if (category.hasSubcategories) ...[
                        SizedBox(width: 5.w),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 15.sp,
                          color: selected ? Colors.white : Colors.black45,
                        ),
                      ],
                    ],
                  ),
                ),
              );
            },
          ),
        ),

        // ======================================================
        // SUBCATEGORIES
        // ======================================================
        if (categories[selectedCategoryIndex].hasSubcategories) ...[
          SizedBox(height: 12.h),

          _buildSubcategories(
            categories[selectedCategoryIndex],
            selectedCategoryIndex,
          ),
        ],
      ],
    );
  }

  // ============================================================
  // SUBCATEGORY SELECTOR
  // ============================================================

  Widget _buildSubcategories(Category category, int categoryIndex) {
    return Container(
      margin: EdgeInsets.only(top: 2.h),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: const Color(0xffF3EEE6), // subtle cream distinction
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xffE5D8C5)),
      ),
      child: SizedBox(
        height: 36.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: category.subcategories.length,
          separatorBuilder: (context, index) {
            return SizedBox(width: 7.w);
          },
          itemBuilder: (context, index) {
            final subcategory = category.subcategories[index];

            final bool selected = selectedSubcategory == subcategory;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedCategoryIndex = categoryIndex;
                  selectedSubcategory = subcategory;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                padding: EdgeInsets.symmetric(horizontal: 13.w),
                decoration: BoxDecoration(
                  color: selected ? bronze : Colors.white,
                  borderRadius: BorderRadius.circular(18.r),
                  border: Border.all(
                    color: selected ? bronze : const Color(0xffD8CDBD),
                  ),
                  boxShadow:
                      selected
                          ? [
                            BoxShadow(
                              color: bronze.withOpacity(0.12),
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                            ),
                          ]
                          : null,
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Small indicator
                    Container(
                      width: 5.w,
                      height: 5.w,
                      decoration: BoxDecoration(
                        color:
                            selected ? Colors.white : bronze.withOpacity(0.65),
                        shape: BoxShape.circle,
                      ),
                    ),

                    SizedBox(width: 6.w),

                    Text(
                      subcategory,
                      style: TextStyle(
                        color:
                            selected ? Colors.white : const Color(0xff6F6253),
                        fontSize: 10.sp,
                        fontWeight:
                            selected ? FontWeight.w600 : FontWeight.w500,
                      ),
                    ),

                    if (selected) ...[
                      SizedBox(width: 5.w),
                      Icon(
                        Icons.check_rounded,
                        size: 13.sp,
                        color: Colors.white,
                      ),
                    ],
                  ],
                ),
              ),
            );
          },
        ),
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
          borderRadius: BorderRadius.circular(20.r),
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
    final visibleProducts = filteredProducts;

    if (visibleProducts.isEmpty) {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 50.h),
        child: Column(
          children: [
            Icon(
              Icons.inventory_2_outlined,
              size: 45.sp,
              color: Colors.black26,
            ),

            SizedBox(height: 12.h),

            Text(
              'No products found',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: 5.h),

            Text(
              selectedSubcategory ?? categories[selectedCategoryIndex].name,
              style: TextStyle(color: Colors.black38, fontSize: 10.sp),
            ),
          ],
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: visibleProducts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 0.50,
      ),
      itemBuilder: (context, index) {
        return _buildProductCard(visibleProducts[index]);
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
  // FILTER BOTTOM SHEET
  // ============================================================

  void _openFilter() {
    // Local state for the bottom sheet expansion.
    int expandedCategoryIndex = selectedCategoryIndex;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            return Container(
              height: 0.82.sh,
              decoration: BoxDecoration(
                color: const Color(0xffFAFAF9),
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
              ),
              child: Column(
                children: [
                  SizedBox(height: 10.h),

                  // ==================================================
                  // HANDLE
                  // ==================================================
                  Container(
                    width: 40.w,
                    height: 4.h,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),

                  // ==================================================
                  // HEADER
                  // ==================================================
                  Padding(
                    padding: EdgeInsets.fromLTRB(18.w, 14.h, 10.w, 12.h),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Filter Products',
                              style: TextStyle(
                                color: darkColor,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                            SizedBox(height: 3.h),

                            Text(
                              'Choose a category or subcategory',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 10.sp,
                              ),
                            ),
                          ],
                        ),

                        const Spacer(),

                        IconButton(
                          onPressed: () {
                            Navigator.pop(sheetContext);
                          },
                          icon: Icon(
                            Icons.close_rounded,
                            size: 22.sp,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Divider(height: 1, color: const Color(0xffE8E4DE)),

                  // ==================================================
                  // CATEGORY + SUBCATEGORY LIST
                  // ==================================================
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];

                        final bool categorySelected =
                            selectedCategoryIndex == index &&
                            selectedSubcategory == null;

                        final bool expanded = expandedCategoryIndex == index;

                        return Column(
                          children: [
                            // ========================================
                            // MAIN CATEGORY
                            // ========================================
                            InkWell(
                              onTap: () {
                                if (category.hasSubcategories) {
                                  setSheetState(() {
                                    if (expandedCategoryIndex == index) {
                                      expandedCategoryIndex = -1;
                                    } else {
                                      expandedCategoryIndex = index;
                                    }
                                  });
                                } else {
                                  setState(() {
                                    selectedCategoryIndex = index;
                                    selectedSubcategory = null;
                                  });

                                  Navigator.pop(sheetContext);
                                }
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 180),
                                margin: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                  vertical: 3.h,
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 14.w,
                                  vertical: 14.h,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      categorySelected
                                          ? bronze.withOpacity(0.10)
                                          : Colors.white,
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(
                                    color:
                                        categorySelected
                                            ? bronze.withOpacity(0.35)
                                            : Colors.transparent,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    // Category indicator
                                    AnimatedContainer(
                                      duration: const Duration(
                                        milliseconds: 180,
                                      ),
                                      width: 7.w,
                                      height: 7.w,
                                      decoration: BoxDecoration(
                                        color:
                                            categorySelected
                                                ? bronze
                                                : Colors.black26,
                                        shape: BoxShape.circle,
                                      ),
                                    ),

                                    SizedBox(width: 11.w),

                                    // Category name
                                    Expanded(
                                      child: Text(
                                        category.name,
                                        style: TextStyle(
                                          color:
                                              categorySelected
                                                  ? bronze
                                                  : darkColor,
                                          fontSize: 13.sp,
                                          fontWeight:
                                              categorySelected
                                                  ? FontWeight.w700
                                                  : FontWeight.w500,
                                        ),
                                      ),
                                    ),

                                    // ==================================
                                    // SUBCATEGORY ARROW
                                    // ==================================
                                    if (category.hasSubcategories)
                                      AnimatedRotation(
                                        duration: const Duration(
                                          milliseconds: 180,
                                        ),
                                        turns: expanded ? 0.5 : 0,
                                        child: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color:
                                              expanded
                                                  ? bronze
                                                  : Colors.black38,
                                          size: 21.sp,
                                        ),
                                      )
                                    else
                                      Icon(
                                        categorySelected
                                            ? Icons.check_rounded
                                            : Icons.arrow_forward_ios_rounded,
                                        color:
                                            categorySelected
                                                ? bronze
                                                : Colors.black26,
                                        size: categorySelected ? 19.sp : 11.sp,
                                      ),
                                  ],
                                ),
                              ),
                            ),

                            // ========================================
                            // SUBCATEGORIES
                            // ========================================
                            if (category.hasSubcategories && expanded)
                              Container(
                                margin: EdgeInsets.fromLTRB(24.w, 0, 12.w, 6.h),
                                padding: EdgeInsets.fromLTRB(
                                  10.w,
                                  6.h,
                                  8.w,
                                  8.h,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xffF3EEE6),
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(
                                    color: const Color(0xffE5D8C5),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    // Small label
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          left: 8.w,
                                          top: 3.h,
                                          bottom: 5.h,
                                        ),
                                        child: Text(
                                          'SUBCATEGORIES',
                                          style: TextStyle(
                                            color: bronze,
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: 0.7,
                                          ),
                                        ),
                                      ),
                                    ),

                                    ...category.subcategories.map((
                                      subcategory,
                                    ) {
                                      final bool subSelected =
                                          selectedCategoryIndex == index &&
                                          selectedSubcategory == subcategory;

                                      return InkWell(
                                        borderRadius: BorderRadius.circular(
                                          8.r,
                                        ),
                                        onTap: () {
                                          setState(() {
                                            selectedCategoryIndex = index;
                                            selectedSubcategory = subcategory;
                                          });

                                          Navigator.pop(sheetContext);
                                        },
                                        child: AnimatedContainer(
                                          duration: const Duration(
                                            milliseconds: 160,
                                          ),
                                          width: double.infinity,
                                          margin: EdgeInsets.symmetric(
                                            vertical: 2.h,
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 10.w,
                                            vertical: 10.h,
                                          ),
                                          decoration: BoxDecoration(
                                            color:
                                                subSelected
                                                    ? bronze.withOpacity(0.14)
                                                    : Colors.transparent,
                                            borderRadius: BorderRadius.circular(
                                              8.r,
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              // Subcategory dot
                                              AnimatedContainer(
                                                duration: const Duration(
                                                  milliseconds: 160,
                                                ),
                                                width: 6.w,
                                                height: 6.w,
                                                decoration: BoxDecoration(
                                                  color:
                                                      subSelected
                                                          ? bronze
                                                          : const Color(
                                                            0xffC8BBA8,
                                                          ),
                                                  shape: BoxShape.circle,
                                                ),
                                              ),

                                              SizedBox(width: 10.w),

                                              Expanded(
                                                child: Text(
                                                  subcategory,
                                                  style: TextStyle(
                                                    color:
                                                        subSelected
                                                            ? bronze
                                                            : const Color(
                                                              0xff62584D,
                                                            ),
                                                    fontSize: 11.sp,
                                                    fontWeight:
                                                        subSelected
                                                            ? FontWeight.w600
                                                            : FontWeight.w400,
                                                  ),
                                                ),
                                              ),

                                              if (subSelected)
                                                Icon(
                                                  Icons.check_rounded,
                                                  color: bronze,
                                                  size: 17.sp,
                                                ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
