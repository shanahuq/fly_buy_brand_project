import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fly_buy_brand_project/ul%20designs/shop_page.dart';

class HomePage extends StatefulWidget {
  final VoidCallback onShopTap;

  const HomePage({super.key, required this.onShopTap});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();
  final PageController pageController = PageController();

  final List<String> bannerImages = [
    'assets/outfit 2.webp',
    'assets/outfit 1.jpg',
  ];

  final List<Map<String, String>> categories = [
    {'name': 'E-Cigs', 'image': 'assets/ecigs_image.jpg'},
    {'name': 'Gadgets', 'image': 'assets/gadgets_image.jpg'},
    {'name': 'Games & Gifts', 'image': 'assets/game_gift_image.jpg'},
    {'name': 'Home & Kitchen', 'image': 'assets/kitchen_image.jpg'},
    {'name': 'Kids', 'image': 'assets/kids_images.jpg'},
    {'name': 'Men', 'image': 'assets/men_accessosaries_image.jpg'},
    {'name': 'Women', 'image': 'assets/women_accesosaries_image.jpg'},
  ];

  final List<Map<String, dynamic>> products = [
    {
      'name': 'Premium Hoodie',
      'image': 'assets/outfit 1.jpg',
      'price': 1499,
      'oldPrice': 1999,
    },
    {
      'name': 'Classic T-Shirt',
      'image': 'assets/outfit 2.webp',
      'price': 899,
      'oldPrice': 1199,
    },
    {
      'name': 'Wireless Gadget',
      'image': 'assets/gadgets_image.jpg',
      'price': 1299,
      'oldPrice': 1699,
    },
    {
      'name': 'Kitchen Essential',
      'image': 'assets/kitchen_image.jpg',
      'price': 799,
      'oldPrice': 999,
    },
    {
      'name': 'Kids Collection',
      'image': 'assets/kids_images.jpg',
      'price': 699,
      'oldPrice': 899,
    },
    {
      'name': 'Men Accessories',
      'image': 'assets/men_accessosaries_image.jpg',
      'price': 599,
      'oldPrice': 799,
    },
    {
      'name': 'Women Accessories',
      'image': 'assets/women_accesosaries_image.jpg',
      'price': 999,
      'oldPrice': 1299,
    },
    {
      'name': 'Game & Gift',
      'image': 'assets/game_gift_image.jpg',
      'price': 499,
      'oldPrice': 699,
    },
  ];

  final ScrollController categoryScrollController = ScrollController();

  Timer? sliderTimer;

  int currentPage = 0;

  @override
  void initState() {
    super.initState();

    sliderTimer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (!pageController.hasClients) return;

      currentPage++;

      if (currentPage >= bannerImages.length) {
        currentPage = 0;
      }

      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    pageController.dispose();
    categoryScrollController.dispose();
    sliderTimer?.cancel();

    super.dispose();
  }

  void slideCategories(double offset) {
    if (!categoryScrollController.hasClients) return;

    final position = categoryScrollController.offset;
    final maxPosition = categoryScrollController.position.maxScrollExtent;

    final newPosition = (position + offset).clamp(0.0, maxPosition);

    categoryScrollController.animateTo(
      newPosition,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0A0D12),
        elevation: 0,
        scrolledUnderElevation: 0,

        leadingWidth: 100.w,

        leading: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
              print('Menu');
            },
            icon: Icon(Icons.menu_rounded, color: Colors.white, size: 24.sp),
          ),
          IconButton(
            onPressed: () {
              print('Shopping bag');
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

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),

        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 4.h, 16.w, 24.h),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchBox(),

              SizedBox(height: 14.h),

              _buildBanner(),

              SizedBox(height: 24.h),

              _buildSectionHeader(
                title: 'Shop by Category',
                actionText: 'View all',
                onAction: () {
                  print('View all categories');
                },
              ),

              SizedBox(height: 12.h),

              _buildCategories(),

              SizedBox(height: 26.h),

              _buildSectionHeader(
                title: 'Latest Products',
                actionText: 'View all',
                onAction: () {
                  print('View all products');
                },
              ),

              SizedBox(height: 12.h),

              _buildProductGrid(),
            ],
          ),
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // SEARCH
  // ---------------------------------------------------------------------------

  Widget _buildSearchBox() {
    return Container(
      height: 48.h,

      decoration: BoxDecoration(
        color: const Color(0xffEFE8DC), // luxury cream background
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Colors.black26, width: 1),
      ),

      child: TextField(
        controller: searchController,

        style: TextStyle(color: Colors.black, fontSize: 14.sp),

        cursorColor: Colors.black,

        decoration: InputDecoration(
          hintText: 'Search products',

          hintStyle: TextStyle(color: Colors.black45, fontSize: 13.sp),

          prefixIcon: Icon(
            Icons.search_rounded,
            color: Colors.black,
            size: 21.sp,
          ),

          suffixIcon:
              searchController.text.isNotEmpty
                  ? IconButton(
                    onPressed: () {
                      searchController.clear();
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.close_rounded,
                      color: Colors.black,
                      size: 19.sp,
                    ),
                  )
                  : null,

          border: InputBorder.none,

          contentPadding: EdgeInsets.symmetric(vertical: 13.h),
        ),

        onChanged: (_) {
          setState(() {});
        },
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // BANNER
  // ---------------------------------------------------------------------------

  Widget _buildBanner() {
    return SizedBox(
      height: 230.h,
      width: double.infinity,

      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),

        child: Stack(
          fit: StackFit.expand,

          children: [
            PageView.builder(
              controller: pageController,

              itemCount: bannerImages.length,

              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },

              itemBuilder: (context, index) {
                return Image.asset(bannerImages[index], fit: BoxFit.cover);
              },
            ),

            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.75)],
                ),
              ),
            ),

            Positioned(
              left: 16.w,
              bottom: 16.h,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    'NEW ARRIVALS',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),

                  SizedBox(height: 3.h),

                  Text(
                    'Explore the latest collection',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(height: 9.h),

                  SizedBox(
                    height: 32.h,

                    child: ElevatedButton(
                      onPressed: widget.onShopTap,

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xff0A0D12),
                        elevation: 0,

                        padding: EdgeInsets.symmetric(horizontal: 14.w),

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                      ),

                      child: Text(
                        'SHOP NOW',
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              right: 14.w,
              bottom: 14.h,

              child: Row(
                children: List.generate(bannerImages.length, (index) {
                  final active = currentPage == index;

                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 250),

                    margin: EdgeInsets.only(left: 5.w),

                    height: 5.h,
                    width: active ? 18.w : 5.w,

                    decoration: BoxDecoration(
                      color: active ? Colors.white : Colors.white54,

                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // SECTION HEADER
  // ---------------------------------------------------------------------------

  Widget _buildSectionHeader({
    required String title,
    required String actionText,
    required VoidCallback onAction,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),

        GestureDetector(
          onTap: onAction,

          child: Row(
            children: [
              Text(
                actionText,
                style: TextStyle(
                  color: const Color(0xffB87820),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(width: 3.w),

              Icon(
                Icons.arrow_forward_ios_rounded,
                color: const Color(0xffB87820),
                size: 10.sp,
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // CATEGORIES
  // ---------------------------------------------------------------------------

  Widget _buildCategories() {
    return SizedBox(
      height: 138.h,

      child: Row(
        children: [
          // GestureDetector(
          //   onTap: () {
          //     slideCategories(-130.w);
          //   },

          //   child: Icon(
          //     Icons.chevron_left_rounded,
          //     color: Colors.white54,
          //     size: 25.sp,
          //   ),
          // ),

          // SizedBox(width: 5.w),
          Expanded(
            child: ListView.builder(
              controller: categoryScrollController,

              scrollDirection: Axis.horizontal,

              physics: const BouncingScrollPhysics(),

              itemCount: categories.length,

              itemBuilder: (context, index) {
                final category = categories[index];

                return GestureDetector(
                  onTap: () {
                    print('${category['name']} selected');
                  },

                  child: Container(
                    width: 108.w,

                    margin: EdgeInsets.only(right: 10.w),

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),

                      child: Stack(
                        fit: StackFit.expand,

                        children: [
                          Image.asset(category['image']!, fit: BoxFit.cover),

                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,

                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.75),
                                ],
                              ),
                            ),
                          ),

                          Positioned(
                            left: 9.w,
                            right: 7.w,
                            bottom: 9.h,

                            child: Text(
                              category['name']!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,

                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // SizedBox(width: 5.w),

          // GestureDetector(
          //   onTap: () {
          //     slideCategories(130.w);
          //   },

          //   child: Icon(
          //     Icons.chevron_right_rounded,
          //     color: Colors.white54,
          //     size: 25.sp,
          //   ),
          // ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // PRODUCT GRID
  // ---------------------------------------------------------------------------

  Widget _buildProductGrid() {
    return GridView.builder(
      shrinkWrap: true,

      physics: const NeverScrollableScrollPhysics(),

      itemCount: products.length,

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,

        crossAxisSpacing: 10.w,

        mainAxisSpacing: 12.h,

        childAspectRatio: 0.68,
      ),

      itemBuilder: (context, index) {
        return _buildProductCard(products[index]);
      },
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    final int price = product['price'];
    final int oldPrice = product['oldPrice'];

    final int discount = ((oldPrice - price) / oldPrice * 100).round();

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10.r),
                  ),

                  child: Image.asset(
                    product['image'],

                    width: double.infinity,
                    height: double.infinity,

                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  top: 8.h,
                  left: 8.w,

                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.w,
                      vertical: 3.h,
                    ),

                    decoration: BoxDecoration(
                      color: const Color(0xff855300),
                      borderRadius: BorderRadius.circular(4.r),
                    ),

                    child: Text(
                      '$discount% OFF',

                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 7.h,
                  right: 7.w,

                  child: GestureDetector(
                    onTap: () {
                      print('${product['name']} favorite');
                    },

                    child: Icon(
                      Icons.favorite_border_rounded,
                      color: Colors.white,
                      size: 20.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(10.w, 9.h, 10.w, 10.h),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  product['name'],

                  maxLines: 1,

                  overflow: TextOverflow.ellipsis,

                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: 5.h),

                Row(
                  children: [
                    Text(
                      '₹$price',

                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    SizedBox(width: 6.w),

                    Text(
                      '₹$oldPrice',

                      style: TextStyle(
                        color: Colors.black26,
                        fontSize: 11.sp,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 8.h),

                SizedBox(
                  width: double.infinity,
                  height: 36.h,
                  child: ElevatedButton(
                    onPressed: () {
                      print('${product['name']} added to cart');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffB87820),
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
                        Icon(Icons.shopping_bag_outlined, size: 16.sp),
                        SizedBox(width: 6.w),
                        Text(
                          'Add to Cart',
                          style: TextStyle(
                            fontSize: 11.sp,
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
}
