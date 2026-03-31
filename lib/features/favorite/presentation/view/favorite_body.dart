import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/features/favorite/presentation/view/widgets/custom_empty_fav.dart';
import 'package:news_app/features/favorite/presentation/view/widgets/one_item_of_fav.dart';
import 'package:news_app/features/favorite/presentation/view_model/fav_provider.dart';
import 'package:news_app/core/widgets/custom_loading.dart';

class FavoriteBody extends ConsumerWidget {
  const FavoriteBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(favProvider);
    return state.when(
      data: (data) {
        if (data.isEmpty) return const CustomEmptyFav();
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            final fav = data[index];
            return OneItemOfFav(fav: fav);
          },
        );
      },
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const CustomLoading(),
    );
  }
}
