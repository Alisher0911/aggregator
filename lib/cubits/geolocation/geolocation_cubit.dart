import 'dart:async';

import 'package:aggregator/data/repositories/geolocation_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

part 'geolocation_state.dart';

class GeolocationCubit extends Cubit<GeolocationState> {
  final GeolocationRepository _geolocationRepository;
  StreamSubscription? _geolocationSubscription;

  GeolocationCubit(
    this._geolocationRepository,
  ) : super(GeolocationState.loading());

  void loadGeolocation() async {
    _geolocationSubscription?.cancel();
    try {
      final position = await _geolocationRepository.getCurrentLocation();
      updateGeolocation(position);
    } catch (_) {
      emit(state.copyWith(geolocationStatus: GeolocationStatus.error));
    }
  }

  void updateGeolocation(Position position) async {
    emit(state.copyWith(position: position, geolocationStatus: GeolocationStatus.success));
  }

  @override
  Future<void> close() {
    _geolocationSubscription?.cancel();
    return super.close();
  }
}
