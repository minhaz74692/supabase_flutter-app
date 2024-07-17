// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:supabase_app/custom_elevated_button.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseCrudOperations extends StatelessWidget {
  const SupabaseCrudOperations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            CustomElevatedButton(
              onPressed: () async {
                // await supabase
                //     .from('cities')
                //     .insert({'name': 'The Shire', 'country_id': 554});
                Future<void> adduser(String name, String email) async {
                  final response =
                      await Supabase.instance.client.from('Users').insert({
                    'name': name,
                    'email': email,
                    "phone": "019827365628",
                    "address": "Anwara, Chattogram"
                  }).select("*");

                  if (response.isNotEmpty) {
                    // Handle error
                    debugPrint('user created succesfully: ${response}');
                  } else {
                    // Handle success
                    debugPrint('User creation failed');
                  }
                }

                adduser("Minhaz", "bdclever.coder@gmail.com");
              },
              title: "Add",
            ),
            CustomElevatedButton(
              title: "Read Users",
              onPressed: () async {
                var response =
                    await Supabase.instance.client.from('Users').select('*');
                if (response.isNotEmpty) {
                  // Handle error
                  debugPrint('Got All Users: ${response}');
                } else {
                  // Handle success
                  debugPrint('Users Get failed');
                }
              },
            ),
            CustomElevatedButton(
              title: "Update User",
              onPressed: () async {
                var response = await Supabase.instance.client
                    .from('Users')
                    .update({"email": "updated2.email@gmail.com"})
                    .eq('user_id', 'abd4d35b-38df-4a82-8901-995c52e35d41')
                    .select();
                if (response.isNotEmpty) {
                  // Handle error
                  debugPrint('Got All Users: ${response}');
                } else {
                  // Handle success
                  debugPrint('Users Update failed');
                }
              },
            ),
            CustomElevatedButton(
              title: "Delete User",
              onPressed: () async {
                try {
                  var response = await Supabase.instance.client
                      .from('Users')
                      .delete()
                      .eq('user_id', 'abd4d35b-38df-4a82-8901-995c52e35d41')
                      .select();
                  if (response.isNotEmpty) {
                    debugPrint('Got All Users: ${response}');
                  }
                } catch (e) {
                  debugPrint("User Delete Error: $e");
                }
              },
            ),
            CustomElevatedButton(
              title: "Filter Users",
              onPressed: () async {
                try {
                  var response = await Supabase.instance.client
                      .from('Users')
                      .select("*")

                      // Filters
                      .eq('email', 'bdclever.coder@gmail.com');

                  debugPrint("Filtered users are: $response");
                  // if (response.isNotEmpty) {
                  //   // Handle error
                  //   debugPrint('Got All Users: ${response}');
                  // } else {
                  //   // Handle success
                  //   debugPrint('User filtering failed');
                  // }
                } catch (e) {
                  debugPrint("Error in filtering: $e");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
