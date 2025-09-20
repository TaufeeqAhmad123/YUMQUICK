import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/widget/custom_background.dart';
import 'package:food_delivery_app/widget/cutom_button.dart';
import 'package:google_fonts/google_fonts.dart';

class CancelOrderScreen extends StatefulWidget {
  const CancelOrderScreen({super.key});

  @override
  State<CancelOrderScreen> createState() => _CancelOrderScreenState();
}

class _CancelOrderScreenState extends State<CancelOrderScreen> {
  int? selectedReason;
  final TextEditingController _otherReasonController = TextEditingController();

  final List<String> reasons = [
    "Lorem ipsum dolor sit amet",
    "Lorem ipsum dolor sit amet",
    "Lorem ipsum dolor sit amet",
    "Lorem ipsum dolor sit amet",
    "Lorem ipsum dolor sit amet",
  ];

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      title: "Cancel Order",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Prosaent pellentesque congue lorem, vel tincidunt tortor.",
            style:
                GoogleFonts.leagueSpartan(color: AppColors.font, fontSize: 14),
          ),
          const SizedBox(height: 20),

          // Reasons List
          SizedBox(
            height: 350 ,
            child: Expanded(
              child: ListView.builder(
                itemCount: reasons.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(reasons[index],style: GoogleFonts.leagueSpartan(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.font,
                    ),),
                    trailing: Radio<int>(
                      value: index,
                      groupValue: selectedReason,
                      onChanged: (value) {
                        setState(() {
                          selectedReason = value;
                        });
                      },
                      activeColor: Colors.orange,
                    ),
                  );
                },
              ),
            ),
          ),


          Text("Others",style: GoogleFonts.leagueSpartan(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.font,
          ),),
          const SizedBox(height: 6),
          TextField(
            controller: _otherReasonController,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: "Others reason...",
              hintStyle: GoogleFonts.leagueSpartan(color: AppColors.font),
              filled: true,
              fillColor: AppColors.yellow,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 20),
          CustomElevatedButton(
            text: "Submit",
            width: double.infinity,
            height: 50,
            onPressed: () {
              // Handle submit action
            },
          ),
        ],
      ),
    );
  }
}
