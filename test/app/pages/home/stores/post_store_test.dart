import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_valuenotifier/app/data/services/post_service.dart';
import 'package:flutter_valuenotifier/app/pages/home/states/post_state.dart';
import 'package:flutter_valuenotifier/app/pages/home/stores/post_store.dart';
import 'package:mocktail/mocktail.dart';
import 'package:value_listenable_test/value_listenable_test.dart';

class PostServiceMock extends Mock implements PostService {}

void main() {
  final service = PostServiceMock();
  final store = PostStore(service);

  test(
    'deve alterar o estado para loaded',
    () async {
      when(() => service.getPosts()).thenAnswer((_) async => []);

      expect(
        store,
        emitValues(
          [
            isA<PostLoading>(),
            isA<PostLoaded>(),
          ],
        ),
      );

      await store.getPosts();
    },
  );

  test(
    'deve alterar o estado para error',
    () async {
      when(() => service.getPosts()).thenThrow(Exception());

      expect(
        store,
        emitValues(
          [
            isA<PostLoading>(),
            isA<PostError>(),
          ],
        ),
      );

      await store.getPosts();
    },
  );
}
