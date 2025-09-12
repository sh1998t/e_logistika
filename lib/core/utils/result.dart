import 'package:dartz/dartz.dart';
import '../errors/failures.dart';

typedef Result<T> = Either<Failure, T>;
typedef ResultVoid = Either<Failure, void>;

