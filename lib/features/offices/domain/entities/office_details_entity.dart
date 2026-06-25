import 'office_entity.dart';
import 'office_trip_entity.dart';

class OfficeDetailsEntity {
  final OfficeEntity office;
  final List<OfficeTripEntity> trips;

  const OfficeDetailsEntity({required this.office, required this.trips});
}
