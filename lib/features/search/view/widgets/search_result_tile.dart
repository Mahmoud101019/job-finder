import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_finder_app/core/styel/color.dart';
import 'package:job_finder_app/features/search/view/screens/search_screen.dart';
import 'package:sizer/sizer.dart';

class SearchResultTile extends StatelessWidget {
  final String tile;
  final SearchType searchType;
  const SearchResultTile(this.tile, this.searchType, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        searchType == SearchType.recent
            ? Iconsax.clock
            : Iconsax.search_status,
        size: 13.5.sp, color: AppTheme.neutral9,),
      title: Text(
        tile,
        style:  TextStyle(
          color: AppTheme.neutral9,
          fontSize: 11.5.sp,
          fontFamily: 'SFProDisplay',
          fontWeight: FontWeight.w400,

        ),
      ),
      trailing: Icon(
        searchType == SearchType.recent
            ? Iconsax.close_circle
            : Iconsax.arrow_right_2,
        size: 18.5.sp,
        color: searchType == SearchType.recent ? AppTheme.danger5 : AppTheme.primary5,
      ),
    );
  }
}
