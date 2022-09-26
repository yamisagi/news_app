import 'package:news_app/api/api_key.dart';

class Service {
  String url = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey';
  String specificUrl =
      'https://newsapi.org/v2/everything?q=&from=2022-09-26&sortBy=popularity&apiKey=$apiKey';
  Service.specifyUrl(String query) {
    specificUrl =
        'https://newsapi.org/v2/everything?q=$query&from=2022-09-26&sortBy=popularity&apiKey=$apiKey';
  }
  Service({required String countryName}) {
    url =
        'https://newsapi.org/v2/top-headlines?country=$countryName&apiKey=$apiKey';
  }
}
