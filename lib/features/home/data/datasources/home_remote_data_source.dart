import 'package:supabase_flutter/supabase_flutter.dart';

class HomeRemoteDataSource {
  final supabase = Supabase.instance.client;

  Future<List<Map<String, dynamic>>> getOffices() async {
    final response = await supabase.from('offices').select();
    return response;
  }

  Future<List<Map<String, dynamic>>> getTrips() async {
    final response = await supabase.from('trips').select();
    return response;
  }

  Future<List<Map<String, dynamic>>> getBanners() async {
    return await supabase.from('banners').select();
  }
}
