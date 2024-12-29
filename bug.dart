```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Assuming JSON response
      final jsonData = jsonDecode(response.body);
      // Accessing data incorrectly: Assuming a direct top-level field
      final data = jsonData['data']; // Error prone if the actual structure is different 
      print(data);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    // Missing proper error handling and retry mechanism for transient network issues
  }
}
```