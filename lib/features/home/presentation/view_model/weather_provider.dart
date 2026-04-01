import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/core/network/location_service.dart';
import 'package:news_app/core/network/service_locator.dart';
import 'package:news_app/features/home/data/model/weather_response.dart';

class WeatherProvider extends AsyncNotifier<WeatherResponse> {
  late final _repo = ref.read(weatherRepoProvider);

  @override
  FutureOr<WeatherResponse> build() async {
    final hasPermission = await LocationService.hasPermission;
    if (!hasPermission) return const WeatherResponse();
    return _getWeather();
  }

  Future<WeatherResponse> _getWeather() async {
    final position = await LocationService.getPosition();
    final lat = position?.latitude ?? 13.0827;
    final long = position?.longitude ?? 80.2707;
    final result = await _repo.getWeather(lat: lat, long: long);
    return result.fold((failure) => throw failure.errormessage, (data) => data);
  }

  Future<void> requestLocationAndRefresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _getWeather(),
    ); 
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
final locationPermissionProvider = FutureProvider<bool>((ref) async {
  return await LocationService.hasPermission;
});
