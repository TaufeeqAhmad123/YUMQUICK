import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/core/constants/app_strings.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/app_colors.dart';
import 'widgets/category_card.dart';
import 'widgets/banner.dart';
import 'widgets/best_seller.dart';
import 'widgets/recommended_widget.dart';
import 'widgets/search_bar.dart';
import 'package:food_delivery_app/screens/auth/widgets/custom_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  int selectedIndex = 0;

  List<String> iconList = [
    'assets/icons/cart.svg',
    'assets/icons/bell.svg',
    'assets/icons/user.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowbase,
      body: Column(
        children: [
          // 🔹 Top Yellow Header
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search + Icons
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: _searchController,
                        label: '',
                        hintText: 'Search here',
                        keyboardType: TextInputType.text,
                        prefixIcon: Icons.search,
                        fillColor: AppColors.font2,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Row(
                      children: List.generate(
                        iconList.length,
                        (index) => Container(
                          margin: const EdgeInsets.only(left: 7),
                          height: 35,
                          width: 35,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              iconList[index],
                              height: 18,
                              width: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Good Morning,',
                  style: GoogleFonts.leagueSpartan(
                    color: AppColors.font2,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Rise and shine it’s breakfast time!',
                  style: GoogleFonts.leagueSpartan(
                    color: AppColors.orangeBase,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),

          // 🔹 White Content Section (scrollable)
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    // Categories
                    SizedBox(
                      height: 130,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemCount: categoriesIcon.length,
                        itemBuilder: (context, index) {
                          final isSelected = index == selectedIndex;
                          return CategoryCard(
                            image: categoriesIcon[index],
                            name: categoriesList[index],
                            isSelected: isSelected,
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Best Seller Section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Best Seller',
                              style: GoogleFonts.leagueSpartan(
                                color: AppColors.font,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              )),
                          Row(
                            children: [
                              Text(
                                'See All',
                                style: GoogleFonts.leagueSpartan(
                                  color: AppColors.orangeBase,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Icon(Icons.arrow_forward_ios,
                                  color: AppColors.orangeBase, size: 16),
                            ],
                          ),
                        ],
                      ),
                    ),
                    BestSellerWidget(),
                    const SizedBox(height: 20),

                    // Banner
                    BannerWidget(),
                    const SizedBox(height: 20),

                    // Recommended
                    RecommendedWidget(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
