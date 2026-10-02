import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_dev_project/core/widget/custom_app_bar.dart';
import 'package:fun_dev_project/core/widget/error_container.dart';
import 'package:fun_dev_project/features/fav/presentation/cubit/fav_item_cubit.dart';
import 'package:fun_dev_project/features/fav/presentation/state/fav_item_state.dart';
import 'package:fun_dev_project/features/item/domain/entity/item_entity.dart';

import '../../../../core/widget/custom_circular_progress_indicator.dart';
import '../../../item/presentation/widget/item_widget.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(showSearch: true, title: "", showShare: false),
      body: BlocBuilder<FavItemCubit, FavItemState>(
        builder: (context, state) {
          if (state is FavItemLoading) {
            return CustomCircularProgressIndicator();
          } else if (state is FavItemSuccess) {
            return ListView.builder(
              itemCount: state.favItemEntity.length,
              itemBuilder: (context, index) {
                return ItemWidget(
                  fromFav: true,
                  itemEntity: ItemEntity(
                    id: state.favItemEntity[index].id,
                    categoryName: state.favItemEntity[index].categoryName,
                    imageUrl: state.favItemEntity[index].imageUrl,
                    name: state.favItemEntity[index].name,
                    price: state.favItemEntity[index].price,
                    rate: state.favItemEntity[index].rate,
                    numberRates: state.favItemEntity[index].numberRates,
                    isFavorite: true,
                    description: state.favItemEntity[index].des,
                  ),
                );
              },
            );
          } else if (state is FavItemError) {
            return ErrorContainer(
              onTap: () {
                context.read<FavItemCubit>().fetchFavItems();
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
