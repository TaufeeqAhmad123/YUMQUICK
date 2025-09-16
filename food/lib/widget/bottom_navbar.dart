import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/core/constants/app_strings.dart';
import 'package:food_delivery_app/screens/home/home_screen.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  final List<String> icons = [
    AppStrings.home,
    AppStrings.fav,
    AppStrings.notifi,
    AppStrings.book,
    AppStrings.book,
  ];
  final List<Widget> screens = const [
    HomeScreen(),
    Center(child: Text("🔍 Search Screen", style: TextStyle(fontSize: 22))),
    Center(child: Text("🛒 Cart Screen", style: TextStyle(fontSize: 22))),
    Center(child: Text("❤️ Favorites Screen", style: TextStyle(fontSize: 22))),
    Center(child: Text("👤 Profile Screen", style: TextStyle(fontSize: 22))),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: Container(
       // margin: const EdgeInsets.all(12),
        height: 60,
     
        decoration: BoxDecoration(
          color: AppColors.orangeBase,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)), // rounded edges
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(icons.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: SvgPicture.asset(
                  icons[index],
                  height: 28,
                  color: _selectedIndex == index ? Colors.white : Colors.black54,
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
