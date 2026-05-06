import 'package:dalil_syria/features/trips/data/models/trip_included_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/trip_details_model.dart';
import '../models/trip_timeline_model.dart';

class TripRemoteDataSource {
  final supabase = Supabase.instance.client;

  Future<TripDetailsModel> getTripDetails(String tripId) async {
    final trip = await supabase
        .from('trips')
        .select()
        .eq('id', tripId)
        .single();

    final imagesData = await supabase
        .from('trip_images')
        .select('sliders_image')
        .eq('trip_id', tripId);

    final data = await supabase
        .from('trip_timeline')
        .select()
        .eq('trip_id', tripId)
        .order('day', ascending: true);
    final includedData = await supabase
        .from('trip_included')
        .select()
        .eq('trip_id', tripId);
    return TripDetailsModel(
      id: trip['id'],
      title: trip['title'],
      image: trip['image'],
      price: (trip['price'] as num).toDouble(),
      location: trip['location'],
      duration_days: trip['duration_days'],
      duration_nights: trip['duration_nights'],
      maxPeople: trip['max_people'],
      description: trip['description'],

      images: (imagesData as List)
          .map((e) => e['sliders_image'] as String)
          .toList(),

      timeline: (data as List)
          .map((e) => TripTimelineModel.fromMap(e))
          .toList(),
      included: (includedData as List)
          .map((e) => TripIncludedModel.fromMap(e))
          .toList(),
    );
  }
}
