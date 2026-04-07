import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class FactDataSource {
  Future<String> getFactDataSource() async {
    try {
      final response = await http.get(Uri.parse('https://catfact.ninja/fact?max_length=1000'));
      final Map<String, dynamic> decodedResponse = jsonDecode(response.body);
      final String fact = decodedResponse['fact'];
      return fact;
    } on http.ClientException catch (e) {
      print('ERROR client exception: $e');
      throw Exception('Error obtaining the fact');
    } on SocketException catch (e) {
      print('ERROR socket exception: $e');
      throw Exception('Error obtaining the fact');
    } catch (e) {
      print('ERROR general: $e');
      throw Exception('Error obtaining the fact');
    }
  }
}
