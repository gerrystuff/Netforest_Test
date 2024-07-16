import 'package:app/config/messages.dart';
import 'package:app/widgets_general/body_app.dart';
import 'package:app/widgets_general/loading_app.dart';
import 'package:app/widgets_general/safe_area_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:app/pages/articles/bloc/bloc.dart' as bloc;
import 'package:url_launcher/url_launcher.dart';

export 'package:app/pages/articles/bloc/bloc.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeAreaApp(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: const Text('Artículos Recientes'),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: BlocProvider.value(
          value: Modular.get<bloc.Bloc>()..add(bloc.LoadInitialEvent()),
          child: BlocListener<bloc.Bloc, bloc.State>(
            listener: (context, state) {
              if (state is bloc.FailuredState) {
                Modular.to.pop();
                AppMessages.showSnackBar(
                  context: context,
                  message: state.model.errorMessage!,
                  backgroundColor: Colors.red,
                );
              }
              if (state is bloc.LoadingState) {
                return LoadingApp.show(context);
              }
              if (state is bloc.LoadedState) {
                Modular.to.pop();
              }
            },
            child: const _Body(),
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    Future<void> _launchUrl(String url) async {
      if (!await launchUrl(Uri.parse(url))) {
        throw Exception('Could not launch $url');
      }
    }

    return BodyApp(
      child: BlocBuilder<bloc.Bloc, bloc.State>(
        bloc: Modular.get<bloc.Bloc>(),
        builder: (context, state) {
          if (state is bloc.LoadedState) {
            return CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Column(
                    children: state.model.articles!.map<Widget>((article) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: ExpansionTile(
                            backgroundColor: Colors.white,
                            title: Row(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: article.urlToImage ?? '',
                                  placeholder: (context, url) => Container(
                                    width: 50.0,
                                    height: 50.0,
                                    color: Colors.grey[200],
                                    child: const Icon(Icons.image,
                                        color: Colors.grey),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Container(
                                    width: 50.0,
                                    height: 50.0,
                                    color: Colors.grey[200],
                                    child: const Icon(Icons.broken_image,
                                        color: Colors.grey),
                                  ),
                                  width: 50.0,
                                  height: 50.0,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(width: 16.0),
                                Expanded(
                                  child: Text(
                                    article.title ?? 'No title',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                      color: Colors.black87,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            subtitle: Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Text(
                                article.author ?? 'Unknown author',
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: GestureDetector(
                                  onTap: () async {
                                    await _launchUrl(article.url!);
                                  },
                                  child: Text(
                                    article.description ?? 'No description',
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black87,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            );
          }

          if (state is bloc.FailuredState) {
            return Center(
              child: Text(state.model.errorMessage!),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
