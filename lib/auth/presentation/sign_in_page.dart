import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:repo_viewer/auth/shared/providers.dart';
import 'package:repo_viewer/core/presentation/routes/app_routes.gr.dart';



class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(
                  MdiIcons.github,
                  size: 150,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Welcome to \n Repo Viewer',
                  style: Theme.of(context).textTheme.headline3,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 32,
                ),
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(authNotifierProvider.notifier)
                        .signIn((authorizationUri) {
                      final completer = Completer<Uri>();
                      AutoRouter.of(context).push(
                        AuthorizationRoute(
                          authorizationUrl: authorizationUri,
                          onAuthorizationCodeRedirectAttempt: (redirectedUrl) {
                            completer.complete(redirectedUrl);
                          },
                        ),
                      );
                      return completer.future;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
