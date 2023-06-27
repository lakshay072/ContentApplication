/*
import 'dart:convert';
import 'package:content_application/models/model_blog.dart';
import 'package:http/http.dart' as http;

class ChargerService {

  Future<List<FirstBlog>> getAll() async {
    const url =
        'https://api.notion.com/v1/blocks/cc9914a294b24306a46d0311baf552e6/children?page_size=200';
    final uri = Uri.parse(url);
    final headers = {
      'Notion-Version': '2022-02-22',
      'Authorization': 'Bearer secret_6FUwEepND9KKRbw6SUxYailRLqVEMbsnhs5DgQxzIQ3',
    };
    final response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      print('Response body: $json');
      final blogs = json.map((e) {
        return FirstBlog(
            quote: e['results'][7]['quote']['rich_text'][0]['text']['content'],
            colorValue: e['colorValue'],
            imageUrl: e['results'][3]['image']['external']['url'],
            heading: e['heading'],
            content: e['results'][5]['paragraph']['rich_text'][0]['text']['content'],
            id: e['id'],
            heading1: e['heading1'],
            heading3: e['heading3'],
            probHeading2: e['probHeading2'],
            probHeading2Description: e['probHeading2Description'],
            solHeading2: e['solHeading2'],
            solHeading2Description: e['solHeading2Description'],
            heading1Video: e['heading1Video'],
        );
      }).toList();
      return blogs;
    }
    return [];
  }
}
*/
