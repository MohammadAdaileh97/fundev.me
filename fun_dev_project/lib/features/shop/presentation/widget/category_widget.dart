import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_dev_project/core/utl/responsive.dart';
import 'package:fun_dev_project/features/item/presentation/cubit/get_items_cubit.dart';
import 'package:fun_dev_project/features/item/presentation/screen/items_screen.dart';

import '../../domain/entity/category_entity.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryEntity categoryEntity;

  const CategoryWidget({super.key, required this.categoryEntity});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<GetItemsCubit>().fetchItems(
          idCategory: categoryEntity.id!,
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemsScreen(idCategory: categoryEntity.id!),
          ),
        );
      },
      child: Container(
        padding: EdgeInsetsDirectional.only(
          start: responsiveWidth(context, 40),

          end: responsiveWidth(context, 40),
          top: responsiveHeight(context, 15),
          bottom: responsiveHeight(context, 15),
        ),
        alignment: AlignmentDirectional.centerStart,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 0.40, color: Color(0xFF9B9B9B)),
            bottom: BorderSide(width: 0.40, color: Color(0xFF9B9B9B)),
          ),
        ),
        child: Text(
          categoryEntity.name ?? "-",
          style: TextStyle(
            color: const Color(0xFF222222),
            fontSize: 16,
            fontFamily: 'Metropolis',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
