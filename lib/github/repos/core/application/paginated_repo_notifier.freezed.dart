// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'paginated_repo_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PaginatedRepoState {
  Fresh<List<GithubRepo>> get repos => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<GithubRepo>> repos) initial,
    required TResult Function(Fresh<List<GithubRepo>> repos, int itemsPerPage)
        loadingInProgress,
    required TResult Function(
            Fresh<List<GithubRepo>> repos, bool isNextPageAvailable)
        loadSuccess,
    required TResult Function(
            Fresh<List<GithubRepo>> repos, GithubFailures failures)
        loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<List<GithubRepo>> repos)? initial,
    TResult? Function(Fresh<List<GithubRepo>> repos, int itemsPerPage)?
        loadingInProgress,
    TResult? Function(Fresh<List<GithubRepo>> repos, bool isNextPageAvailable)?
        loadSuccess,
    TResult? Function(Fresh<List<GithubRepo>> repos, GithubFailures failures)?
        loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<GithubRepo>> repos)? initial,
    TResult Function(Fresh<List<GithubRepo>> repos, int itemsPerPage)?
        loadingInProgress,
    TResult Function(Fresh<List<GithubRepo>> repos, bool isNextPageAvailable)?
        loadSuccess,
    TResult Function(Fresh<List<GithubRepo>> repos, GithubFailures failures)?
        loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingInProgress value) loadingInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadingInProgress value)? loadingInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingInProgress value)? loadingInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaginatedRepoStateCopyWith<PaginatedRepoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedRepoStateCopyWith<$Res> {
  factory $PaginatedRepoStateCopyWith(
          PaginatedRepoState value, $Res Function(PaginatedRepoState) then) =
      _$PaginatedRepoStateCopyWithImpl<$Res, PaginatedRepoState>;
  @useResult
  $Res call({Fresh<List<GithubRepo>> repos});

  $FreshCopyWith<List<GithubRepo>, $Res> get repos;
}

/// @nodoc
class _$PaginatedRepoStateCopyWithImpl<$Res, $Val extends PaginatedRepoState>
    implements $PaginatedRepoStateCopyWith<$Res> {
  _$PaginatedRepoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repos = null,
  }) {
    return _then(_value.copyWith(
      repos: null == repos
          ? _value.repos
          : repos // ignore: cast_nullable_to_non_nullable
              as Fresh<List<GithubRepo>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FreshCopyWith<List<GithubRepo>, $Res> get repos {
    return $FreshCopyWith<List<GithubRepo>, $Res>(_value.repos, (value) {
      return _then(_value.copyWith(repos: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $PaginatedRepoStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Fresh<List<GithubRepo>> repos});

  @override
  $FreshCopyWith<List<GithubRepo>, $Res> get repos;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$PaginatedRepoStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repos = null,
  }) {
    return _then(_$_Initial(
      null == repos
          ? _value.repos
          : repos // ignore: cast_nullable_to_non_nullable
              as Fresh<List<GithubRepo>>,
    ));
  }
}

/// @nodoc

class _$_Initial extends _Initial {
  const _$_Initial(this.repos) : super._();

  @override
  final Fresh<List<GithubRepo>> repos;

  @override
  String toString() {
    return 'PaginatedRepoState.initial(repos: $repos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.repos, repos) || other.repos == repos));
  }

  @override
  int get hashCode => Object.hash(runtimeType, repos);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<GithubRepo>> repos) initial,
    required TResult Function(Fresh<List<GithubRepo>> repos, int itemsPerPage)
        loadingInProgress,
    required TResult Function(
            Fresh<List<GithubRepo>> repos, bool isNextPageAvailable)
        loadSuccess,
    required TResult Function(
            Fresh<List<GithubRepo>> repos, GithubFailures failures)
        loadFailure,
  }) {
    return initial(repos);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<List<GithubRepo>> repos)? initial,
    TResult? Function(Fresh<List<GithubRepo>> repos, int itemsPerPage)?
        loadingInProgress,
    TResult? Function(Fresh<List<GithubRepo>> repos, bool isNextPageAvailable)?
        loadSuccess,
    TResult? Function(Fresh<List<GithubRepo>> repos, GithubFailures failures)?
        loadFailure,
  }) {
    return initial?.call(repos);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<GithubRepo>> repos)? initial,
    TResult Function(Fresh<List<GithubRepo>> repos, int itemsPerPage)?
        loadingInProgress,
    TResult Function(Fresh<List<GithubRepo>> repos, bool isNextPageAvailable)?
        loadSuccess,
    TResult Function(Fresh<List<GithubRepo>> repos, GithubFailures failures)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(repos);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingInProgress value) loadingInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadingInProgress value)? loadingInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingInProgress value)? loadingInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends PaginatedRepoState {
  const factory _Initial(final Fresh<List<GithubRepo>> repos) = _$_Initial;
  const _Initial._() : super._();

  @override
  Fresh<List<GithubRepo>> get repos;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadingInProgressCopyWith<$Res>
    implements $PaginatedRepoStateCopyWith<$Res> {
  factory _$$_LoadingInProgressCopyWith(_$_LoadingInProgress value,
          $Res Function(_$_LoadingInProgress) then) =
      __$$_LoadingInProgressCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Fresh<List<GithubRepo>> repos, int itemsPerPage});

  @override
  $FreshCopyWith<List<GithubRepo>, $Res> get repos;
}

/// @nodoc
class __$$_LoadingInProgressCopyWithImpl<$Res>
    extends _$PaginatedRepoStateCopyWithImpl<$Res, _$_LoadingInProgress>
    implements _$$_LoadingInProgressCopyWith<$Res> {
  __$$_LoadingInProgressCopyWithImpl(
      _$_LoadingInProgress _value, $Res Function(_$_LoadingInProgress) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repos = null,
    Object? itemsPerPage = null,
  }) {
    return _then(_$_LoadingInProgress(
      null == repos
          ? _value.repos
          : repos // ignore: cast_nullable_to_non_nullable
              as Fresh<List<GithubRepo>>,
      null == itemsPerPage
          ? _value.itemsPerPage
          : itemsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_LoadingInProgress extends _LoadingInProgress {
  const _$_LoadingInProgress(this.repos, this.itemsPerPage) : super._();

  @override
  final Fresh<List<GithubRepo>> repos;
  @override
  final int itemsPerPage;

  @override
  String toString() {
    return 'PaginatedRepoState.loadingInProgress(repos: $repos, itemsPerPage: $itemsPerPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadingInProgress &&
            (identical(other.repos, repos) || other.repos == repos) &&
            (identical(other.itemsPerPage, itemsPerPage) ||
                other.itemsPerPage == itemsPerPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, repos, itemsPerPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadingInProgressCopyWith<_$_LoadingInProgress> get copyWith =>
      __$$_LoadingInProgressCopyWithImpl<_$_LoadingInProgress>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<GithubRepo>> repos) initial,
    required TResult Function(Fresh<List<GithubRepo>> repos, int itemsPerPage)
        loadingInProgress,
    required TResult Function(
            Fresh<List<GithubRepo>> repos, bool isNextPageAvailable)
        loadSuccess,
    required TResult Function(
            Fresh<List<GithubRepo>> repos, GithubFailures failures)
        loadFailure,
  }) {
    return loadingInProgress(repos, itemsPerPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<List<GithubRepo>> repos)? initial,
    TResult? Function(Fresh<List<GithubRepo>> repos, int itemsPerPage)?
        loadingInProgress,
    TResult? Function(Fresh<List<GithubRepo>> repos, bool isNextPageAvailable)?
        loadSuccess,
    TResult? Function(Fresh<List<GithubRepo>> repos, GithubFailures failures)?
        loadFailure,
  }) {
    return loadingInProgress?.call(repos, itemsPerPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<GithubRepo>> repos)? initial,
    TResult Function(Fresh<List<GithubRepo>> repos, int itemsPerPage)?
        loadingInProgress,
    TResult Function(Fresh<List<GithubRepo>> repos, bool isNextPageAvailable)?
        loadSuccess,
    TResult Function(Fresh<List<GithubRepo>> repos, GithubFailures failures)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (loadingInProgress != null) {
      return loadingInProgress(repos, itemsPerPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingInProgress value) loadingInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadingInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadingInProgress value)? loadingInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) {
    return loadingInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingInProgress value)? loadingInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadingInProgress != null) {
      return loadingInProgress(this);
    }
    return orElse();
  }
}

abstract class _LoadingInProgress extends PaginatedRepoState {
  const factory _LoadingInProgress(
          final Fresh<List<GithubRepo>> repos, final int itemsPerPage) =
      _$_LoadingInProgress;
  const _LoadingInProgress._() : super._();

  @override
  Fresh<List<GithubRepo>> get repos;
  int get itemsPerPage;
  @override
  @JsonKey(ignore: true)
  _$$_LoadingInProgressCopyWith<_$_LoadingInProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadSuccessCopyWith<$Res>
    implements $PaginatedRepoStateCopyWith<$Res> {
  factory _$$_LoadSuccessCopyWith(
          _$_LoadSuccess value, $Res Function(_$_LoadSuccess) then) =
      __$$_LoadSuccessCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Fresh<List<GithubRepo>> repos, bool isNextPageAvailable});

  @override
  $FreshCopyWith<List<GithubRepo>, $Res> get repos;
}

/// @nodoc
class __$$_LoadSuccessCopyWithImpl<$Res>
    extends _$PaginatedRepoStateCopyWithImpl<$Res, _$_LoadSuccess>
    implements _$$_LoadSuccessCopyWith<$Res> {
  __$$_LoadSuccessCopyWithImpl(
      _$_LoadSuccess _value, $Res Function(_$_LoadSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repos = null,
    Object? isNextPageAvailable = null,
  }) {
    return _then(_$_LoadSuccess(
      null == repos
          ? _value.repos
          : repos // ignore: cast_nullable_to_non_nullable
              as Fresh<List<GithubRepo>>,
      isNextPageAvailable: null == isNextPageAvailable
          ? _value.isNextPageAvailable
          : isNextPageAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_LoadSuccess extends _LoadSuccess {
  const _$_LoadSuccess(this.repos, {required this.isNextPageAvailable})
      : super._();

  @override
  final Fresh<List<GithubRepo>> repos;
  @override
  final bool isNextPageAvailable;

  @override
  String toString() {
    return 'PaginatedRepoState.loadSuccess(repos: $repos, isNextPageAvailable: $isNextPageAvailable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadSuccess &&
            (identical(other.repos, repos) || other.repos == repos) &&
            (identical(other.isNextPageAvailable, isNextPageAvailable) ||
                other.isNextPageAvailable == isNextPageAvailable));
  }

  @override
  int get hashCode => Object.hash(runtimeType, repos, isNextPageAvailable);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadSuccessCopyWith<_$_LoadSuccess> get copyWith =>
      __$$_LoadSuccessCopyWithImpl<_$_LoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<GithubRepo>> repos) initial,
    required TResult Function(Fresh<List<GithubRepo>> repos, int itemsPerPage)
        loadingInProgress,
    required TResult Function(
            Fresh<List<GithubRepo>> repos, bool isNextPageAvailable)
        loadSuccess,
    required TResult Function(
            Fresh<List<GithubRepo>> repos, GithubFailures failures)
        loadFailure,
  }) {
    return loadSuccess(repos, isNextPageAvailable);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<List<GithubRepo>> repos)? initial,
    TResult? Function(Fresh<List<GithubRepo>> repos, int itemsPerPage)?
        loadingInProgress,
    TResult? Function(Fresh<List<GithubRepo>> repos, bool isNextPageAvailable)?
        loadSuccess,
    TResult? Function(Fresh<List<GithubRepo>> repos, GithubFailures failures)?
        loadFailure,
  }) {
    return loadSuccess?.call(repos, isNextPageAvailable);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<GithubRepo>> repos)? initial,
    TResult Function(Fresh<List<GithubRepo>> repos, int itemsPerPage)?
        loadingInProgress,
    TResult Function(Fresh<List<GithubRepo>> repos, bool isNextPageAvailable)?
        loadSuccess,
    TResult Function(Fresh<List<GithubRepo>> repos, GithubFailures failures)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(repos, isNextPageAvailable);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingInProgress value) loadingInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadingInProgress value)? loadingInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingInProgress value)? loadingInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadSuccess extends PaginatedRepoState {
  const factory _LoadSuccess(final Fresh<List<GithubRepo>> repos,
      {required final bool isNextPageAvailable}) = _$_LoadSuccess;
  const _LoadSuccess._() : super._();

  @override
  Fresh<List<GithubRepo>> get repos;
  bool get isNextPageAvailable;
  @override
  @JsonKey(ignore: true)
  _$$_LoadSuccessCopyWith<_$_LoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadFailureCopyWith<$Res>
    implements $PaginatedRepoStateCopyWith<$Res> {
  factory _$$_LoadFailureCopyWith(
          _$_LoadFailure value, $Res Function(_$_LoadFailure) then) =
      __$$_LoadFailureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Fresh<List<GithubRepo>> repos, GithubFailures failures});

  @override
  $FreshCopyWith<List<GithubRepo>, $Res> get repos;
  $GithubFailuresCopyWith<$Res> get failures;
}

/// @nodoc
class __$$_LoadFailureCopyWithImpl<$Res>
    extends _$PaginatedRepoStateCopyWithImpl<$Res, _$_LoadFailure>
    implements _$$_LoadFailureCopyWith<$Res> {
  __$$_LoadFailureCopyWithImpl(
      _$_LoadFailure _value, $Res Function(_$_LoadFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repos = null,
    Object? failures = null,
  }) {
    return _then(_$_LoadFailure(
      null == repos
          ? _value.repos
          : repos // ignore: cast_nullable_to_non_nullable
              as Fresh<List<GithubRepo>>,
      null == failures
          ? _value.failures
          : failures // ignore: cast_nullable_to_non_nullable
              as GithubFailures,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $GithubFailuresCopyWith<$Res> get failures {
    return $GithubFailuresCopyWith<$Res>(_value.failures, (value) {
      return _then(_value.copyWith(failures: value));
    });
  }
}

/// @nodoc

class _$_LoadFailure extends _LoadFailure {
  const _$_LoadFailure(this.repos, this.failures) : super._();

  @override
  final Fresh<List<GithubRepo>> repos;
  @override
  final GithubFailures failures;

  @override
  String toString() {
    return 'PaginatedRepoState.loadFailure(repos: $repos, failures: $failures)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadFailure &&
            (identical(other.repos, repos) || other.repos == repos) &&
            (identical(other.failures, failures) ||
                other.failures == failures));
  }

  @override
  int get hashCode => Object.hash(runtimeType, repos, failures);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadFailureCopyWith<_$_LoadFailure> get copyWith =>
      __$$_LoadFailureCopyWithImpl<_$_LoadFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<GithubRepo>> repos) initial,
    required TResult Function(Fresh<List<GithubRepo>> repos, int itemsPerPage)
        loadingInProgress,
    required TResult Function(
            Fresh<List<GithubRepo>> repos, bool isNextPageAvailable)
        loadSuccess,
    required TResult Function(
            Fresh<List<GithubRepo>> repos, GithubFailures failures)
        loadFailure,
  }) {
    return loadFailure(repos, failures);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<List<GithubRepo>> repos)? initial,
    TResult? Function(Fresh<List<GithubRepo>> repos, int itemsPerPage)?
        loadingInProgress,
    TResult? Function(Fresh<List<GithubRepo>> repos, bool isNextPageAvailable)?
        loadSuccess,
    TResult? Function(Fresh<List<GithubRepo>> repos, GithubFailures failures)?
        loadFailure,
  }) {
    return loadFailure?.call(repos, failures);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<GithubRepo>> repos)? initial,
    TResult Function(Fresh<List<GithubRepo>> repos, int itemsPerPage)?
        loadingInProgress,
    TResult Function(Fresh<List<GithubRepo>> repos, bool isNextPageAvailable)?
        loadSuccess,
    TResult Function(Fresh<List<GithubRepo>> repos, GithubFailures failures)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(repos, failures);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingInProgress value) loadingInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadingInProgress value)? loadingInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) {
    return loadFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingInProgress value)? loadingInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class _LoadFailure extends PaginatedRepoState {
  const factory _LoadFailure(
          final Fresh<List<GithubRepo>> repos, final GithubFailures failures) =
      _$_LoadFailure;
  const _LoadFailure._() : super._();

  @override
  Fresh<List<GithubRepo>> get repos;
  GithubFailures get failures;
  @override
  @JsonKey(ignore: true)
  _$$_LoadFailureCopyWith<_$_LoadFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
