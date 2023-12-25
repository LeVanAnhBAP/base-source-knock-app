import 'package:dartz/dartz.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

abstract class UseCase<Data, Params> {
  const UseCase();
  Future<Data> call(Params params);
}

class NoParams {}

abstract class EitherUseCase<Data, Params> {
  const EitherUseCase();
  Future<Either<BaseException, Data>> call(Params params);
}
