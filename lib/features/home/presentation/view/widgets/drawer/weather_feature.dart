import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/app_assets.dart';
import 'package:news_app/core/widgets/custom_loading.dart';
import 'package:news_app/features/home/presentation/view_model/weather_provider.dart';

class WeatherFeature extends ConsumerWidget {
  const WeatherFeature({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final current = ref.watch(weatherProviderNotifier);
    final hasPermission = ref.watch(locationPermissionProvider).value ?? false;
    final theme = Theme.of(context);
    return Theme(
      data: theme.copyWith(
        dividerTheme: const DividerThemeData(color: Colors.transparent),
      ),
      child: current.when(
        data: (data) {
          return DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(_getWeatherBackground(data.main?.temp ?? 0)),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _customStack(temp: "${data.main?.temp.toInt()} °", size: 26),
                _customStack(temp: data.name, size: 14),
                Spacer(),
                Row(
                  children: [
                    Spacer(),
                    if (!hasPermission)
                      IconButton(
                        onPressed: () async {
                          await ref
                              .read(weatherProviderNotifier.notifier)
                              .requestLocationAndRefresh();
                          ref.invalidate(locationPermissionProvider);
                        },
                        icon: Icon(
                          Icons.location_off,
                          color: Colors.white,
                          size: 22.sp,
                        ),
                      )
                    else
                      IconButton(
                        onPressed: () => ref
                            .read(weatherProviderNotifier.notifier)
                            .refresh(),
                        icon: Icon(
                          Icons.refresh,
                          color: Colors.black.withOpacity(0.5),
                          size: 22.sp,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          );
        },
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        loading: () => DrawerHeader(child: const CustomLoading()),
      ),
    );
  }
}

Widget _customStack({required String? temp, required double size}) {
  return Stack(
    children: [
      Text(
        temp ?? "N/A",
        style: TextStyle(
          fontSize: size.sp,
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 3
            ..color = Colors.black45,
        ),
      ),
      Text(
        temp ?? "N/A",
        style: TextStyle(fontSize: size.sp, color: Colors.white),
      ),
    ],
  );
}

String _getWeatherBackground(double temp) {
  if (temp < 0) {
    return AppAssets.snowy;
  } else if (temp < 10) {
    return AppAssets.rainy;
  } else if (temp < 25) {
    return AppAssets.cloudy;
  } else {
    return AppAssets.sunny;
  }
}
