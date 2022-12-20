import 'dart:convert';

import '../Model/memorandumData.dart';
import 'package:http/http.dart' as http;

class RemoteData{


Future<List<Data>> getData() async {
  final response = await http
      .get(Uri.parse('https://api.punkapi.com/v2/beers?brewed_before=11-2012&abv_gt=6'));

  if (response.statusCode == 200) {
    var json = response.body;
    return  dataFromJson(json);
  } else {
    throw Exception('Failed to load data');
  }
}

}