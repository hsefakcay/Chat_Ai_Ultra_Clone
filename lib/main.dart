import 'package:chat_ai_ultra_clone/features/chat_history/presentation/bloc/chat_history_bloc.dart';
import 'package:chat_ai_ultra_clone/features/discover/presentation/bloc/discover_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/theme/app_theme.dart';
import 'features/chat/presentation/cubit/chat_cubit.dart';
import 'core/di/injection_container.dart' as di;
import 'product/init/app_start.dart';
import 'product/routes/app_router.dart';

Future<void> main() async {
  await AppStart.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<ChatCubit>()),
        BlocProvider(create: (_) => di.sl<ChatHistoryBloc>()),
        BlocProvider(create: (_) => di.sl<DiscoverBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chat AI Ultra Clone',
        theme: AppTheme.dark,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: AppRouter.splash,
      ),
    );
  }
}
