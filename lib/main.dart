import 'package:flutter/material.dart';
import 'package:kopianan_s/app.dart';
import 'package:kopianan_s/injection.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Supabase.initialize(
    url: 'https://yjpfgpxxenvjpmcrgsms.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlqcGZncHh4ZW52anBtY3Jnc21zIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NjIyMDg0MzUsImV4cCI6MTk3Nzc4NDQzNX0.be5Jebz9Eg6mQrobYJUoyTWB8MPfnoi_yMz-7EqBD5A',
  );
  runApp(App());
}
