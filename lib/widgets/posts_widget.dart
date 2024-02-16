import 'package:flutter/material.dart';
import '../models/post.dart';
import '../services/api_service.dart';

class PostsWidget extends StatefulWidget {
  @override
  _PostsWidgetState createState() => _PostsWidgetState();
}

class _PostsWidgetState extends State<PostsWidget> {
  late Future<List<Post>> _futurePosts;

  @override
  void initState() {
    super.initState();
    _futurePosts = ApiService().fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Post>>(
      future: _futurePosts,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          // Si los datos están disponibles, los muestra en una lista con estilo.
          return ListView.builder(
            itemCount: snapshot.data!.length
                .clamp(0, 5), // Muestra solo los primeros 5
            itemBuilder: (context, index) {
              return Card(
                color: Colors.blue.shade50, // Fondo azul claro de la tarjeta
                elevation: 4, // Añade una sombra para un efecto elevado
                margin: EdgeInsets.all(8), // Espacio alrededor de la tarjeta
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      10), // Bordes redondeados para la tarjeta
                ),
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  leading: CircleAvatar(
                    backgroundColor: Colors
                        .blue.shade600, // Color azul más oscuro para el avatar
                    foregroundColor: Colors.white,
                    child: Text('${index + 1}',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  title: Text(
                    snapshot.data![index].title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors
                          .blue.shade800, // Texto azul oscuro para el título
                    ),
                  ),
                  subtitle: Text(
                    'Post ID: ${snapshot.data![index].id}',
                    style: TextStyle(
                        color: Colors.blue
                            .shade800), // Texto azul oscuro para el subtítulo
                  ),
                  // Eliminamos el trailing para quitar la flecha
                ),
              );
            },
          );
        } else {
          // Muestra un indicador de carga mientras los datos están cargando.
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
