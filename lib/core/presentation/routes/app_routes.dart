import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repo_viewer/auth/presentation/authorization_page.dart';
import 'package:repo_viewer/auth/presentation/sign_in_page.dart';
import 'package:repo_viewer/splash/splash_page.dart';
import 'package:repo_viewer/starred_repo/starred_repo_page.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: SignInPage, path: '/sign-in' ),
    MaterialRoute(page: StarredRepoPage,path:  '/starred'),
    MaterialRoute(page: AuthorizationPage,path:  '/auth'),
  ],
  replaceInRouteName: 'Page,Route',
)
class $AppRouter {}
