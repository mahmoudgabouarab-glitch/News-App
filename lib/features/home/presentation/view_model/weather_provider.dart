import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/core/network/service_locator.dart';
import 'package:news_app/features/home/data/model/weather_response.dart';

class WeatherProvider extends AsyncNotifier<WeatherResponse> {
  late final _repo = ref.read(weatherRepoProvider);

  @override
  FutureOr<WeatherResponse> build() {
    return _getWeather();
  }

  Future<WeatherResponse> _getWeather() async {
    final result = await _repo.getWeather(lat: 13.0827, long: 80.2707);
    return result.fold((failure) => throw failure.errormessage, (data) => data);
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _getWeather());
  }
}

final weatherProviderNotifier =
    AsyncNotifierProvider<WeatherProvider, WeatherResponse>(
      WeatherProvider.new,
    );
