import 'posts.dart';

class Backend {
  /// Singleton pattern used here.
  static final Backend _backend = Backend._internal();

  factory Backend() {
    return _backend;
  }

  Backend._internal();


  final _posts = [
    Posts(
      id: 1,
      autor: 'Enrique Campozano',
      comentario: 'Posts sobre inteligencia artificial',
      privacidad:" Publica",
      visualizacion:"40 personas",
    ),
    Posts(
      id: 2,
      autor: 'Enrique Villalba',
      comentario: 'Posts sobre movil',
      privacidad:" Publica",
      visualizacion:"15 personas",
    ),
    Posts(
      id: 3,
      autor: 'Luis Alba',
      comentario: 'Posts sobre rede sociales',
      privacidad:" Publica",
      visualizacion:"40 personas",
    ),
    
      ];

   List<Posts> getPosts() {
    return _posts;
  }


  void markPostsAsRead(int id) {
    final index = _posts.indexWhere((post) => post.id == id);
    _posts[index].read = true;
  }


  void deletePosts(int id) {
    _posts.removeWhere((post) => post.id == id);
  }
 
}
