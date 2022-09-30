part of 'geolocation_cubit.dart';

enum GeolocationStatus { loading, success, error }

class GeolocationState extends Equatable {
  final Position position;
  final GeolocationStatus geolocationStatus;

  const GeolocationState({
    required this.position,
    required this.geolocationStatus
  });

  factory GeolocationState.loading() {
    return GeolocationState(
      position: Position(longitude: 0, latitude: 0, timestamp: DateTime.now(), accuracy: 0, altitude: 0, heading: 0, speed: 0, speedAccuracy: 0),
      geolocationStatus: GeolocationStatus.loading
    );
  }

  @override
  List<Object> get props => [position, geolocationStatus];

  GeolocationState copyWith({
    Position? position,
    GeolocationStatus? geolocationStatus,
  }) {
    return GeolocationState(
      position: position ?? this.position,
      geolocationStatus: geolocationStatus ?? this.geolocationStatus,
    );
  }
}
