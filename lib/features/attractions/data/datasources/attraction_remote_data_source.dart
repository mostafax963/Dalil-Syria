import 'package:dalil_syria/features/attractions/data/models/highlights_model.dart';
import 'package:dalil_syria/features/home/data/models/trip_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/attraction_model.dart';

class AttractionRemoteDataSource {
  final supabase = Supabase.instance.client;

  Future<List<AttractionModel>> getAttractions() async {
    final data = await supabase.from('attractions').select();

    return (data as List).map((e) => AttractionModel.fromMap(e)).toList();
  }

  Future<Map<String, dynamic>> getAttractionDetails(String id) async {
    final attraction = await supabase
        .from('attractions')
        .select()
        .eq('id', id)
        .single();

    final highlights = await supabase
        .from('attraction_highlights')
        .select()
        .eq('attraction_id', id);

    final trips = await supabase.from('trips').select().eq('attraction_id', id);

    return {
      "attraction": AttractionModel.fromMap(attraction),

      "highlights": (highlights as List)
          .map((e) => HighlightsModel.fromMap(e))
          .toList(),

      "trips": (trips as List).map((e) => TripModel.fromMap(e)).toList(),
    };
  }
}
