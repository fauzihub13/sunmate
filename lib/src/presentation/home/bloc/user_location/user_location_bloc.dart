import 'package:bloc/bloc.dart';
import 'package:flutter_sunmate/src/data/models/response/weather/weather_response_model.dart';
import 'package:flutter_sunmate/src/data/sources/weather/user_location_datasources.dart';
import 'package:flutter_sunmate/src/data/sources/weather/weather_remote_datasources.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';

part 'user_location_bloc.freezed.dart';
part 'user_location_event.dart';
part 'user_location_state.dart';

class UserLocationBloc extends Bloc<UserLocationEvent, UserLocationState> {
  final UserLocationDatasource userLocationDatasource;
  final WeatherRemoteDatasources weatherRemoteDatasources;
  UserLocationBloc(this.userLocationDatasource, this.weatherRemoteDatasources)
      : super(const _Initial()) {
    on<_GetLocation>(
      (event, emit) async {
        emit(const _Loading());
        final result = await userLocationDatasource.determinePosition();
        result.fold((error) => emit(_Error(error)),
            (success) => emit(_LocationLoaded(success)));
      },
    );

    on<_GetWeather>(
      (event, emit) async {
        emit(const _Loading());

        // Mendapatkan posisi
        final positionResult = await userLocationDatasource.determinePosition();
        await positionResult.fold(
          (positionError) async {
            emit(_Error(positionError));
          },
          (positionSuccess) async {
            // Mendapatkan cuaca berdasarkan posisi
            emit(const _Loading());
            final weatherResult = await weatherRemoteDatasources.getWeather(
              positionSuccess.latitude.toString(),
              positionSuccess.longitude.toString(),
            );
            weatherResult.fold(
              (error) => emit(_Error(error)),
              (weatherSuccess) => emit(_WeatherLoaded(weatherSuccess)),
            );
          },
        );
      },
    );
  }
}
