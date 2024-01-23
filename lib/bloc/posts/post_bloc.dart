import 'package:bloc/bloc.dart';
import 'package:bloc_practice/bloc/posts/post_event.dart';
import 'package:bloc_practice/bloc/posts/post_states.dart';
import 'package:bloc_practice/repository/post_repository.dart';
import 'package:bloc_practice/utils/enums.dart';

class PostBloc extends Bloc<PostEvent, PostStates> {
  PostRepository postRepository = PostRepository();
  PostBloc() : super(const PostStates()) {
    on<PostFetched>(fetchPostApi);
  }

  void fetchPostApi(PostFetched event, Emitter<PostStates> emit) async{
    await postRepository.fetchPost().then((value) {
      emit(
        state.copyWith(
          postStatus: PostStatus.success,
          message: "Success",
          postList: value,
        ),
      );
    }).onError((error, stackTrace) {
      print(error);
      print(stackTrace);
      emit(
        state.copyWith(
          postStatus: PostStatus.failure,
          message: error.toString(),
        ),
      );
    });
  }
}
