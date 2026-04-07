import 'dart:convert';
import 'dart:io';

import 'package:cat_directory_app/data/models/breed_model.dart';
import 'package:http/http.dart' as http;

class ListBreedsDataSource {
  Future<List<BreedModel>> getBreedsDataSource({int limit = 10, int page = 1}) async {
    try {
      final response = await http.get(
        Uri.parse('https://catfact.ninja/breeds?limit=${limit}&page=${page}'),
      );
      final Map<String, dynamic> decodedResponse = jsonDecode(response.body);
      final List<BreedModel> breeds = decodedResponse['data']
          .map<BreedModel>((e) => BreedModel.fromJson(e))
          .toList();
      return breeds;
    } on http.ClientException catch (e) {
      print('ERROR client exception: $e');
      throw Exception('Error obtaining the breeds');
    } on SocketException catch (e) {
      print('ERROR socket exception: $e');
      throw Exception('Error obtaining the breeds');
    } catch (e) {
      print('ERROR general: $e');
      throw Exception('Error obtaining the breeds');
    }
  }
}
