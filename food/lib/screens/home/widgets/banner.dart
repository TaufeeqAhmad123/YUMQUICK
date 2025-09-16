
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/core/constants/app_strings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final CarouselSliderController _controller = CarouselSliderController();
  int _activeIndex = 0;
  final List<Map<String, String>> banners = [
    {
      "image": AppStrings.food3,
      "title": "Experince our \n delicious new dish",
      "subtitle": "30% OFF"
    },
    {
      "image": AppStrings.food2,
      "title": "Save Water",
      "subtitle":"30% OFF"
    },
    {
      "image": AppStrings.food1,
      "title": "Go Green",
      "subtitle": "30% OFF"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: _controller,
          options: CarouselOptions(
            height: 150,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 1, // full width
            onPageChanged: (index, reason) {
              setState(() => _activeIndex = index);
            },
          ),
          itemCount: banners.length,
          itemBuilder: (context, index, realIndex) {
            final banner = banners[index];
            return Container(
              width: 393,
              height: 150,
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Left: Image
                  
                  // Right: Yellow background with 2 lines text
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.orangeBase,
                        borderRadius:
                            BorderRadius.horizontal(left: Radius.circular(20)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            banner["title"]!,
                            style: GoogleFonts.leagueSpartan(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            banner["subtitle"]!,
                            style: GoogleFonts.leagueSpartan(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.horizontal(right: Radius.circular(20)),
                      child: Image.asset(
                        banner["image"]!,
                        fit: BoxFit.cover,
                        height: double.infinity,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        const SizedBox(height: 10),
        AnimatedSmoothIndicator(
          activeIndex: _activeIndex,
          count: banners.length,
          effect: ExpandingDotsEffect(
            activeDotColor: AppColors.orangeBase,
            dotColor: Colors.grey.shade400,
            dotHeight: 5,
            dotWidth: 15,
            spacing: 6,
          ),
          onDotClicked: (index) => _controller.animateToPage(index),
        ),
      ],
    );
  }
}
