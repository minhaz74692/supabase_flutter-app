import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
   await dotenv.load();
  await Supabase.initialize(
    url: 'https://rwxiaztkwzestzrgpdug.supabase.co',
    anonKey: dotenv.env['SUPABAEKEY'] ?? '',
    // 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ3eGlhenRrd3plc3R6cmdwZHVnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTg2NDUwODcsImV4cCI6MjAzNDIyMTA4N30.SpL-q92aGXyGi1AZWH29N9QQLiFxRnpKPvsj99uC0mo',
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'users',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _future = Supabase.instance.client.from('users').select();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final todos = snapshot.data!;

          return ListView.builder(
            shrinkWrap: true,
            itemCount: todos.length,
            itemBuilder: ((context, index) {
              final todo = todos[index];
              return ListTile(
                title: Text(
                  todo['user_name'].toString(),
                  style: TextStyle(color: Colors.black),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
