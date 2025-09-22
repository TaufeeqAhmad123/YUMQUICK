import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/widget/custom_background.dart';
import 'package:food_delivery_app/widget/cutom_button.dart';
import 'package:google_fonts/google_fonts.dart';

class LeaveReviewScreen extends StatefulWidget {
  const LeaveReviewScreen({super.key});

  @override
  State<LeaveReviewScreen> createState() => _LeaveReviewScreenState();
}

class _LeaveReviewScreenState extends State<LeaveReviewScreen> {
  int selectedStars = 0;
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        title: 'Leave a Review',
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Food Image
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQoXJ-SpgQcosV5bLyw_Ay-FY38jfsS2FtP9CM0RpoW4oGIhZ_8SoqbEiz1Wo9DqQJhMIgrjdRWfsFPUmXMm4tRVoxJvk-kgoLg8STZYCXF",
                width: 157,
                height: 157,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 12),
            
            // Dish name
             Text(
              "Chicken Curry",
              style: GoogleFonts.leagueSpartan(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.font,
              ),
            ),

            const SizedBox(height: 8),

             Text(
              "We'd love to know what you think of your dish.",
              textAlign: TextAlign.center,
              style: GoogleFonts.leagueSpartan(
                fontSize: 25,
                color: AppColors.font,
              ),
            ),

            const SizedBox(height: 16),

            // Star Rating
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                final isSelected = index < selectedStars;
                return IconButton(
                  onPressed: () {
                    setState(() {
                      selectedStars = index + 1;
                    });
                  },
                  icon: Icon(
                    Icons.star,
                    size: 32,
                    color: isSelected ? Colors.deepOrange : Colors.orange[300],
                  ),
                );
              }),
            ),

            const SizedBox(height: 12),

             Text(
              "Leave us your comment!",
              style: GoogleFonts.leagueSpartan(
                fontSize: 25,
                color: AppColors.font,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 12),

            // Comment Box
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF9C4), // light yellow
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: _commentController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    hintText: "Write Review...",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(12),
                  ),
                ),
              ),
            ),

            const Spacer(),

            // Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                      child: CustomElevatedButton(
                          text: 'Cancel',
                          width: 200,
                          height: 50,
                          textColor: AppColors.orangeBase,
                          color: AppColors.orengeLight,
                          onPressed: () {})),
                  const SizedBox(width: 16),
                  Expanded(
                      child: CustomElevatedButton(
                          text: 'Submit',
                          width: 200,
                          height: 50,
                          textColor: Colors.white,
                          onPressed: () {})),
                ],
              ),
            )
          ],
        ));
  }
}
