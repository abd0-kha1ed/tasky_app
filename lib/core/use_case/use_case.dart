import 'package:dartz/dartz.dart';
import 'package:to_do_app/core/errors/excptions.dart';

abstract class UseCase<Type, Param> {
  Future<Either<ServerException, Type>> call(Param param);
}

class NoParam {}
