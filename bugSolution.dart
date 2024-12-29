```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      // Safer way to access data, handling potential null values
      return jsonBody['data'] ?? [];
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    // Retry mechanism for transient errors (e.g., network issues)
    // ... Add your retry logic here ...
    rethrow; // Re-throw the exception to be handled by a higher level
  }
}

void main() async {
  try {
    final data = await fetchData();
    print('Data: $data'); //Robust data access
  } catch (e) {
    print('An error occurred: $e');
  }
}
```