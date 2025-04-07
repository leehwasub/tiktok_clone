import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/common/widgets/main_navigation/main_navigation_screen.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/features/authentication/repos/authentication_repo.dart';
import 'package:tiktok_clone/features/authentication/sign_up_screen.dart';
import 'package:tiktok_clone/features/inbox/activity_screen.dart';
import 'package:tiktok_clone/features/inbox/chat_detail_screen.dart';
import 'package:tiktok_clone/features/inbox/chats_screen.dart';
import 'package:tiktok_clone/features/notification/notifications_provider.dart';
import 'package:tiktok_clone/features/onboarding/interests_screen.dart';
import 'package:tiktok_clone/features/videos/video_recording_screen.dart';

final routerProvider = Provider(
  (ref) {
    return GoRouter(
        initialLocation: "/home",
        redirect: (context, state) {
          final isLoggedIn = ref.read(authRepo).isLoggedIn;

          if (!isLoggedIn) {
            if (state.subloc != SignUpScreen.routeURL &&
                state.subloc != LoginScreen.routeURL) {
              return SignUpScreen.routeURL;
            }
          }
          return null;
        },
        routes: [
          ShellRoute(
            builder: (context, state, child) {
              ref.read(notificationsProvider(context));
              return child;
            },
            routes: [
              GoRoute(
                path: SignUpScreen.routeURL,
                name: SignUpScreen.routeName,
                builder: (context, state) => SignUpScreen(),
              ),
              GoRoute(
                path: LoginScreen.routeURL,
                name: LoginScreen.routeName,
                builder: (context, state) => LoginScreen(),
              ),
              GoRoute(
                path: InterestsScreen.routeURL,
                name: InterestsScreen.routeName,
                builder: (context, state) => InterestsScreen(),
              ),
              GoRoute(
                path: "/:tab(home|discover|inbox|profile)",
                name: MainNavigationScreen.routeName,
                builder: (context, state) {
                  final tab = state.params["tab"]!;
                  return MainNavigationScreen(
                    tab: tab,
                  );
                },
              ),
              GoRoute(
                path: ActivityScreen.routeURL,
                name: ActivityScreen.routeName,
                builder: (context, state) => ActivityScreen(),
              ),
              GoRoute(
                path: ChatsScreen.routeURL,
                name: ChatsScreen.routeName,
                builder: (context, state) => ChatsScreen(),
                routes: [
                  GoRoute(
                    path: ChatDetailScreen.routeURL,
                    name: ChatDetailScreen.routeName,
                    builder: (context, state) {
                      final chatId = state.params["chatId"]!;
                      return ChatDetailScreen(chatId: chatId);
                    },
                  ),
                ],
              ),
              GoRoute(
                path: VideoRecordingScreen.routURL,
                name: VideoRecordingScreen.routeName,
                pageBuilder: (context, state) => CustomTransitionPage(
                  child: VideoRecordingScreen(),
                  transitionDuration: Duration(
                    microseconds: 200,
                  ),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    final position = Tween(
                      begin: Offset(0, 1),
                      end: Offset.zero,
                    ).animate(animation);
                    return SlideTransition(
                      position: position,
                      child: child,
                    );
                  },
                ),
              ),
            ],
          )
        ]);
  },
);
