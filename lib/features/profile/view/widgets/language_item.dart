import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_finder_app/core/styel/color.dart';
import 'package:job_finder_app/features/profile/model/languageModel.dart';
import 'package:job_finder_app/features/profile/view_model/profile_cubit.dart';
import 'package:sizer/sizer.dart';


class CustomLanguageItem extends StatefulWidget {
  final int value;
  final LanguageModel languageModel;

  const CustomLanguageItem(this.value, this.languageModel, {super.key});

  @override
  State<CustomLanguageItem> createState() => _CustomLanguageItemState();
}

class _CustomLanguageItemState extends State<CustomLanguageItem> {
  late ProfileCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = ProfileCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return ListTile(
          onTap: () {
            cubit.selectChoice(widget.value);
          },
          leading: SizedBox(
            width: 8.5.w,
            height: 2.5.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Image.network(
                widget.languageModel.flag,
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            widget.languageModel.lang,
            style: TextStyle(
              color: AppTheme.neutral9,
              fontSize: 13.5.sp,
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w500,

            ),
          ),
          trailing: Radio(
            value: widget.value,
            groupValue: cubit.selectedChoice,
            activeColor: AppTheme.primary5,
            splashRadius: 25,
            onChanged: (value) {},
          ),
          contentPadding: EdgeInsets.zero,
        );
      },
    );
  }
}