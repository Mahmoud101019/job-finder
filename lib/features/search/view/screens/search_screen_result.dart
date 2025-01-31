import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_finder_app/core/shimmer/shimmer_recently_jobs_list_view.dart';
import 'package:job_finder_app/core/widget/header.dart';
import 'package:job_finder_app/features/home/view/widget/recent_job_item.dart';
import 'package:job_finder_app/features/search/view/screens/search_screen_not_found.dart';
import 'package:job_finder_app/features/search/view/widgets/filter_body.dart';
import 'package:job_finder_app/features/search/view/widgets/search_filter_drop_down.dart';
import 'package:job_finder_app/features/search/view_model/search_cubit.dart';

class SearchScreenResult extends StatefulWidget {
  const SearchScreenResult({Key? key}) : super(key: key);

  @override
  State<SearchScreenResult> createState() => _SearchScreenResultState();
}

class _SearchScreenResultState extends State<SearchScreenResult> {

  late SearchCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = SearchCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              /// Filteration Setting
              Builder(builder: (ctx) {
                return IconButton(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    onPressed: () {
                      Scaffold.of(ctx).showBottomSheet(
                        (BuildContext context) =>const FilterBody(),
                      );
                    },
                    icon: const Icon(
                      Iconsax.setting_4,
                      size: 24.0,
                    ));
              }),
              const FilterDropDownOption('Remote', isSelected: true),
              const FilterDropDownOption('Full Time', isSelected: true),
              const FilterDropDownOption('Post date'),
              const FilterDropDownOption('Experience level'),
            ],
          ),
        ),
        BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            if (state is SearchEmpty) {
              return const SearchScreenNotFound();
            }
            if (state is SearchLoaded) {
              return Column(
                children: [
                  CustomHeader('Featuring ${cubit.foundResults.length} jobs'),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => RecentJobItem(
                              jobData: cubit.foundResults[index],
                            ),
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: cubit.foundResults.length),
                  ),
                ],
              );
            }
            return const Padding(
              padding: EdgeInsets.all(24.0),
              child: ShimmerRecentlyListView(),
            );

          },
        )
      ],
    );
  }
}
