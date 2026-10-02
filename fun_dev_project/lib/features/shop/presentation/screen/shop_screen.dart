import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_dev_project/core/utl/responsive.dart';
import 'package:fun_dev_project/core/widget/custom_app_bar.dart';
import 'package:fun_dev_project/l10n/app_localizations.dart';
import 'package:fun_dev_project/core/widget/custom_button.dart';
import 'package:fun_dev_project/core/widget/custom_circular_progress_indicator.dart';
import 'package:fun_dev_project/core/widget/error_container.dart';

import '../cubit/get_categories_cubit.dart';
import '../state/get_categories_state.dart';
import '../widget/category_widget.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showSearch: true,
        title: AppLocalizations.of(context)!.categories,
        showShare: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: responsiveHeight(context, 16),
              bottom: responsiveHeight(context, 16),
            ),
            child: CustomButton(
              text: AppLocalizations.of(context)!.viewAllItems,
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
              bottom: responsiveHeight(context, 16),
              left: responsiveWidth(context, 16),
              right: responsiveWidth(context, 16),
            ),
            child: Text(
              AppLocalizations.of(context)!.chooseCategory,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF9B9B9B),
                fontSize: 14,
                fontFamily: 'Metropolis',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          BlocBuilder<GetCategoriesCubit, GetCategoriesState>(
            builder: (context, getCategoriesState) {
              if (getCategoriesState is GetCategoriesStateLoading) {
                return CustomCircularProgressIndicator();
              } else if (getCategoriesState is GetCategoriesStateSuccess) {
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return CategoryWidget(
                        categoryEntity: getCategoriesState.categories[index],
                      );
                    },
                    itemCount: getCategoriesState.categories.length,
                  ),
                );
              } else if (getCategoriesState is GetCategoriesStateError) {
                return ErrorContainer(
                  onTap: () {
                    context.read<GetCategoriesCubit>().fetchCategories();
                  },
                );
              } else {
                return SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
