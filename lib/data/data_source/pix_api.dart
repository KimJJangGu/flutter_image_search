import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_search/data/dto/pix_dto.dart';

class PixabayApi {
  Future<PixDto> getImagesResult(String query) async {
    final response = await http.get(Uri.parse(
        'https://pixabay.com/api/?key=10711147-dc41758b93b263957026bdadb&q=$query&image_type=photo'));
    return PixDto.fromJson(jsonDecode(response.body));
  }
}
