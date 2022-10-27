import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer/auth/aplication/auth_notifier.dart';
import 'package:repo_viewer/auth/shared/providers.dart';
import 'package:repo_viewer/core/presentation/routes/app_routes.gr.dart';
import 'package:repo_viewer/core/shared/providers.dart';

final initializationProvider = FutureProvider<Unit>((ref) async {
  ref.read(dioProvider)
    ..options = BaseOptions(
      headers: {'Accept': 'application/vnd.github.html+json'},
      validateStatus: (status) =>
          status != null && status >= 200 && status < 400,
    )
    ..interceptors.add(
      ref.read(oAuth2InterceptorProvider),
    );

  await ref.read(sembastProvider).initialize();

  final authNotifier = ref.read(authNotifierProvider.notifier);
  await authNotifier.checkAndUpdateAuthStatus();

  return unit;
});

class AppWidget extends ConsumerWidget {
  AppWidget({super.key});

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(initializationProvider, (previous, next) {});

    ref.listen<AuthState>(authNotifierProvider, (prevState, state) {
      state.maybeMap(
        orElse: () {},
        authenticated: (_) {
          appRouter.pushAndPopUntil(
            const StarredReposRoute(),
            predicate: (route) => false,
          );
        },
        unauthenticated: (_) {
          appRouter.pushAndPopUntil(
            const SignInRoute(),
            predicate: (route) => false,
          );
        },
      );
    });

    return MaterialApp.router(
      title: 'Repo Viewer',
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
