import 'dart:convert';
import 'package:http/http.dart' as http;
import '../modules/news/componen/todaydeals.dart';
import 'data_endpoint/news.dart';
import 'package:shared_preferences/shared_preferences.dart';

class API {
  static const _bengkellyUrl = 'https://bengkelly.co.id/wp-json/wp/v2/posts';
  static const _fleetMaintenanceUrl = 'https://fleetmaintenance.co.id/wp-json/wp/v2/posts';

  static Future<List<Post>> fetchPostsFromSource({
    required String url,
    int perPage = 10,
    int page = 1,
  }) async {
    final response = await http.get(Uri.parse('$url?_embed&per_page=$perPage&page=$page'));

    if (response.statusCode == 200) {
      List<dynamic> postsJson = json.decode(response.body);
      return postsJson.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts: ${response.reasonPhrase}');
    }
  }

  static Future<List<Post>> fetchBengkellyPosts({int perPage = 10, int page = 1}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedData = prefs.getString('bengkelly_posts');

    if (savedData != null && savedData.isNotEmpty) {
      List<dynamic> postsJson = json.decode(savedData);
      return postsJson.map((json) => Post.fromJson(json)).toList();
    } else {
      List<Post> posts = await fetchPostsFromSource(url: _bengkellyUrl, perPage: perPage, page: page);
      return posts;
    }
  }

  static Future<List<Post>> fetchFleetMaintenancePosts({int perPage = 10, int page = 1}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedData = prefs.getString('fleet_maintenance_posts');

    if (savedData != null && savedData.isNotEmpty) {
      List<dynamic> postsJson = json.decode(savedData);
      return postsJson.map((json) => Post.fromJson(json)).toList();
    } else {
      List<Post> posts = await fetchPostsFromSource(url: _fleetMaintenanceUrl, perPage: perPage, page: page);
      return posts;
    }
  }
}
