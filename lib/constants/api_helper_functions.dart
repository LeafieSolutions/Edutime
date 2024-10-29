import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiHelperFunction {
  Future<dynamic> apiResponse(String apiPath) async {
    try {
      final response = await http.get(Uri.parse(apiPath));

      if (response.statusCode == 200) {
        // Decode the JSON data from the response
        final data = json.decode(response.body);
        return data; // Return the decoded data
      } else {
        // Handle any other status codes
        throw Exception('Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Print the error for debugging or log it
      if (kDebugMode) {
        print("Error fetching API data: $e");
      }
      return null;
    }
  }

  // Helper function for POST requests with error handling
  Future<dynamic> postRequest(String url, Map<String, dynamic> body) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      // Check for successful response
      if (response.statusCode == 200) {
        return jsonDecode(response.body); // Parse JSON response
      } else {
        // Handle non-200 responses
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      // Handle errors such as network issues
      throw Exception('Error making POST request: $error');
    }
  }
}