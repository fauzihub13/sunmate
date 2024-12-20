import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';

class UserLocationDatasource {
  /// Determine the current position of the device.
  Future<Either<String, Position>> determinePosition() async {
    try {
      // Check if location services are enabled.
      if (!await Geolocator.isLocationServiceEnabled()) {
        return const Left('Location services are disabled.');
      }

      // Check and request permissions.
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return const Left('Location permissions are denied.');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return const Left(
          'Location permissions are permanently denied. We cannot request permissions.',
        );
      }

      // Get current position.
      final position = await Geolocator.getCurrentPosition();
      return Right(position);
    } catch (e) {
      // Handle any unexpected errors.
      return Left('Failed to get location: ${e.toString()}');
    }
  }
}
