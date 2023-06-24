import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../post/create_post.dart';
import 'bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state is HomeError) {
          return Center(
            child: Text(state.message),
          );
        }

        if (state is HomeLoaded) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Flutter Demo'),
            ),
            body: ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                final post = state.posts[index];
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.body),
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreatePost(),
                  ),
                );
              },
              child: const Icon(Icons.add),
            ),
          );
        }

        return Container();
      },
    );
  }
}
