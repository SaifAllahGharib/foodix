import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final SupabaseClient _client;

  SupabaseService._privateConstructor() : _client = Supabase.instance.client;

  static final SupabaseService _instance =
      SupabaseService._privateConstructor();

  factory SupabaseService() {
    return _instance;
  }

  SupabaseClient get client => _client;
}
