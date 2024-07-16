import 'package:app/config/apis/app_api_mixin.dart';
import 'package:app/pages/articles/models/article.dart';

class Repository with AppApiMixin {

    Future<List<Article>> loadArticles() async {
  
        return await getArticles();

    }
}
