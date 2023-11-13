import 'dart:convert';

import 'package:entrada_dados/model/video.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

const ID_CANAL = "UC28hwHqqtAOY6xF_cf1s-ww";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";
String KEY_API = dotenv.get('CHAVE_TOUTUBE_API');

class Api {
  final httpsUri = Uri(
    scheme: 'https',
    host: 'www.googleapis.com',
    path: 'youtube/v3/search',
    fragment: 'numbers',
    queryParameters: {
      'part': 'snippet',
      'type': 'video',
      'maxResults': '20',
      'order': 'date',
      'key': KEY_API,
      'q': 'date'
    },
  );

  pesquisa(String pesquisa) async {
    final httpsUri = Uri(
      scheme: 'https',
      host: 'www.googleapis.com',
      path: 'youtube/v3/search',
      fragment: 'numbers',
      queryParameters: {
        'part': 'snippet',
        'type': 'video',
        'maxResults': '20',
        'order': 'date',
        'key': KEY_API,
        'q': 'date'
      },
    );

    http.Response response = await http.get(httpsUri);

    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);

      List<Video> videos = dadosJson["items"].map<Video>((map) {
        return Video.fromJson(map);
      }).toList();

      for (var video in videos) {
        print(video.descricao);
      }
    } else {
      print(httpsUri);
    }
  }
}
