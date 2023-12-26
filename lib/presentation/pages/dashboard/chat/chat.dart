import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/pages/dashboard/chat/chat_bloc.dart';

// TODO: Add the page to the router
@RoutePage()
class DashBoardChatPage extends StatefulWidget {
  @override
  State<DashBoardChatPage> createState() => _DashBoardChatPageState();
}

class _DashBoardChatPageState extends State<DashBoardChatPage> {
  // TODO: Register the bloc in the provider
  final ChatBloc _bloc = getIt.get<ChatBloc>();

  @override
  void dispose() {
    _bloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Chat Page'),
        ),
        body: const Center(
          child: Text('Chat Page'),
        ),
      ),
    );
  }
}
