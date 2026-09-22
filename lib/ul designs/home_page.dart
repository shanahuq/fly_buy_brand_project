import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();

  // Page controller for image slider
  final PageController pageController = PageController();

  // Your banner images
  final List<String> bannerImages = [
    'assets/outfit 2.webp',
    'assets/outfit 1.jpg',
  ];

  int currentPage = 0;
  Timer? sliderTimer;

  @override
  void initState() {
    super.initState();

    // Automatically change image every 4 seconds
    sliderTimer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (pageController.hasClients) {
        currentPage++;

        // Go back to first image
        if (currentPage >= bannerImages.length) {
          currentPage = 0;
        }

        pageController.animateToPage(
          currentPage,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    pageController.dispose();
    sliderTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0A0D12),

      appBar: AppBar(
        backgroundColor: const Color(0xff0A0D12),
        leadingWidth: 100.w,

        leading: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: SizedBox(
            width: 50.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'FBB',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25.sp,
                    color: Colors.white,
                    height: 1,
                  ),
                ),
                Text(
                  'FLYBUYBRAND',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 8.sp,
                    color: const Color.fromARGB(129, 255, 255, 255),
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
        ),

        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: const Icon(Icons.shopping_bag_outlined, color: Colors.white),
          ),

          Padding(
            padding: EdgeInsets.only(left: 8.w, right: 16.w),
            child: const Icon(Icons.menu_rounded, color: Colors.white),
          ),
        ],
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),

        child: Column(
          children: [
            SizedBox(height: 10.h),

            // ================= SEARCH BOX =================
            Container(
              height: 50.h,

              decoration: BoxDecoration(
                color: const Color(0xff171B22),
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: Colors.white.withOpacity(0.1)),
              ),

              child: TextField(
                controller: searchController,

                style: TextStyle(color: Colors.white, fontSize: 14.sp),

                cursorColor: Colors.white,

                decoration: InputDecoration(
                  hintText: 'Search products...',

                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.4),
                    fontSize: 14.sp,
                  ),

                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white.withOpacity(0.6),
                    size: 22.sp,
                  ),

                  suffixIcon:
                      searchController.text.isNotEmpty
                          ? IconButton(
                            onPressed: () {
                              searchController.clear();
                              setState(() {});
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Colors.white54,
                            ),
                          )
                          : null,

                  border: InputBorder.none,

                  contentPadding: EdgeInsets.symmetric(
                    vertical: 14.h,
                    horizontal: 10.w,
                  ),
                ),

                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),

            SizedBox(height: 12.h),

            // ================= IMAGE SLIDER =================
            Container(
              height: 250.h,
              width: double.infinity,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),

              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),

                child: Stack(
                  children: [
                    // ================= IMAGES =================
                    PageView.builder(
                      controller: pageController,

                      itemCount: bannerImages.length,

                      onPageChanged: (index) {
                        setState(() {
                          currentPage = index;
                        });
                      },

                      itemBuilder: (context, index) {
                        return Image.asset(
                          bannerImages[index],
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      },
                    ),

                    // ================= GRADIENT =================
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,

                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.15),
                              Colors.black.withOpacity(0.75),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // ================= TEXT =================
                    Positioned(
                      left: 18.w,
                      bottom: 18.h,

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            'NEW COLLECTION',

                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.5,
                            ),
                          ),

                          SizedBox(height: 4.h),

                          Text(
                            'Elevate Your Style',

                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                          SizedBox(height: 10.h),

                          ElevatedButton(
                            onPressed: () {
                              print('Shop Now clicked');
                            },

                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: const Color(0xff0A0D12),

                              elevation: 0,

                              padding: EdgeInsets.symmetric(
                                horizontal: 18.w,
                                vertical: 10.h,
                              ),

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),

                            child: Text(
                              'SHOP NOW',

                              style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.8,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // ================= DOT INDICATOR =================
                    Positioned(
                      bottom: 12.h,
                      right: 18.w,

                      child: Row(
                        children: List.generate(bannerImages.length, (index) {
                          final bool isActive = currentPage == index;

                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 300),

                            margin: EdgeInsets.only(left: 5.w),

                            height: 6.h,

                            width: isActive ? 20.w : 6.w,

                            decoration: BoxDecoration(
                              color: isActive ? Colors.white : Colors.white54,

                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text('Shop by Category',style: TextStyle(fontWeight: FontWeight.bold,),)
          ],
        ),
      ),
    );
  }
}
