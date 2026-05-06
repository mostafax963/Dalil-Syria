import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileRemoteDataSource {
  final supabase = Supabase.instance.client;

  Future<Map<String, dynamic>> getProfile() async {
    final user = supabase.auth.currentUser;

    if (user == null) throw Exception("Not logged in");

    final data = await supabase
        .from('profiles')
        .select()
        .eq('id', user.id)
        .maybeSingle();

    return {"user": user, "profile": data};
  }

  Future<void> logout() async {
    await supabase.auth.signOut();
  }
}
