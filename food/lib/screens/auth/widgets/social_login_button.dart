import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/app_colors.dart';

class SocialLoginButton extends StatelessWidget {
  final String icon;

  final VoidCallback onPressed;

  const SocialLoginButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration:const BoxDecoration(shape: BoxShape.circle, color: AppColors.orengeLight,),
     
      child: SvgPicture.asset(
        icon,
        height: 40,
        width: 40,
      ),
    );
  }
}
