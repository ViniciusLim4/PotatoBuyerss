import 'package:fpdart/fpdart.dart';

abstract class UseCase<Entity, Params> {
  Future<Either<Exception, Entity>> call({required Params params});
}

abstract class UseCaseWithoutParams<Entity> {
  Future<Either<Exception, Entity>> call();
}

class NoParams {
  const NoParams();
}
