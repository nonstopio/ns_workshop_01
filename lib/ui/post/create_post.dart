import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop_01/ui/home/bloc/home_bloc.dart';

import '../../data/model/post.dart';
import 'bloc/post_bloc.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  String title = '';
  String body = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create Post'),
        ),
        body: BlocConsumer<PostBloc, PostState>(
          listener: (context, state) {
            if (state is PostLoaded) {
              context.read<HomeBloc>().add(const HomeLoad());
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Title',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          title = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Body',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          body = value;
                        });
                      },
                      maxLines: 5,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<PostBloc>().add(
                              AddPost(
                                Post(title: title, body: body),
                              ),
                            );
                      },
                      child: (state is PostLoading)
                          ? const Center(child: CircularProgressIndicator())
                          : const Text('Submit'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
