
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/core/widgets/custom_loading.dart';
import 'package:news_app/features/home/presentation/view_model/weather_provider.dart';

class WeatherFeature extends ConsumerWidget {
  const WeatherFeature({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final current = ref.watch(weatherProviderNotifier);
    final theme = Theme.of(context);
    return Theme(
      data: theme.copyWith(
        dividerTheme: const DividerThemeData(color: Colors.transparent),
      ),
      child: current.when(
        data: (data) {
          return DrawerHeader(
            decoration: BoxDecoration(color: theme.scaffoldBackgroundColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      data.main?.temp.toString() ?? "0",
                      style: TextStyle(fontSize: 30),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        ref.read(weatherProviderNotifier.notifier).refresh();
                      },
                      icon: Icon(Icons.refresh),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  data.name ?? "",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                Spacer(),
                Divider(color: Colors.grey),
              ],
            ),
          );
        },
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        loading: () => const CustomLoading(),
      ),
    );
  }
}
