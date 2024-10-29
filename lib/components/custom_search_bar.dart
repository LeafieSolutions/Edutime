import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: Theme.of(context).textTheme.headlineMedium?.color,
        borderRadius: BorderRadius.circular(8.r)
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search units',
          hintStyle: TextStyle(
            color: Theme.of(context).hintColor,
            fontSize: 12.spMax,
            fontFamily: 'Montserrat',
            fontVariations: <FontVariation>[FontVariation('wght', 500)]
          ),
          prefixIcon: Padding(
            padding: EdgeInsetsDirectional.all(14.w),
            child: SvgPicture.asset(
              'assets/icons/Search.svg',
              colorFilter: ColorFilter.mode(
                Theme.of(context).hintColor,
                BlendMode.srcIn
              ),
            ),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h)
        ),
      ),
    );
  }
}
