import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_dev_project/core/widget/custom_app_bar.dart';
import 'package:fun_dev_project/core/widget/custom_circular_progress_indicator.dart';
import 'package:fun_dev_project/core/widget/error_container.dart';
import 'package:fun_dev_project/features/item/presentation/widget/item_widget.dart';

import '../cubit/get_items_cubit.dart';
import '../state/get_items_state.dart';

class ItemsScreen extends StatelessWidget {
  final String idCategory;

  const ItemsScreen({super.key, required this.idCategory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(showSearch: true, title: "", showShare: false),
      body: BlocBuilder<GetItemsCubit, GetItemsState>(
        builder: (context, getItemsState) {
          if (getItemsState is GetItemsStateLoading) {
            return CustomCircularProgressIndicator();
          } else if (getItemsState is GetItemsStateSuccess) {
            return ListView.builder(
              itemCount: getItemsState.items.length,
              itemBuilder: (context, index) {
                return ItemWidget(
                  itemEntity: getItemsState.items[index],
                  fromFav: false,
                );
              },
            );
          } else if (getItemsState is GetItemsStateError) {
            return ErrorContainer(
              onTap: () {
                context.read<GetItemsCubit>().fetchItems(
                  idCategory: idCategory,
                );
              },
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
