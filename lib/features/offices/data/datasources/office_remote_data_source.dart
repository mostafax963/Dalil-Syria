import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/office_model.dart';
import '../models/trip_model.dart';

class OfficeRemoteDataSource {
  final supabase = Supabase.instance.client;

  Future<OfficeModel> getOffice(String officeId) async {
    final data = await supabase
        .from('offices')
        .select()
        .eq('id', officeId)
        .single();

    return OfficeModel.fromMap(data);
  }

  Future<List<TripModel>> getOfficeTrips(String officeId) async {
    final data = await supabase
        .from('trips')
        .select()
        .eq('office_id', officeId);

    return data.map((e) => TripModel.fromMap(e)).toList();
  }
}
