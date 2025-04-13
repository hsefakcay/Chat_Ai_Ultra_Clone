import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/init/theme/app_theme.dart';
import 'features/chat/presentation/cubit/chat_cubit.dart';
import 'core/injection_container.dart' as di;
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
    return BlocProvider(
      create: (_) => di.sl<ChatCubit>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chat AI Ultra Clone',
        theme: AppTheme.light,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: AppRouter.chat,
      ),
    );
  }
}
