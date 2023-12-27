import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/pages/{{name.snakeCase()}}/{{name.snakeCase()}}_bloc.dart';

// TODO: Add the page to the router
@RoutePage()
class {{name.pascalCase()}}Page extends StatefulWidget {
  @override
  State<{{name.pascalCase()}}Page> createState() => _{{name.pascalCase()}}PageState();
}

class _{{name.pascalCase()}}PageState extends State<{{name.pascalCase()}}Page> {
  final {{name.pascalCase()}}Bloc _bloc = getIt.get<{{name.pascalCase()}}Bloc>();

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
          title: const Text('{{name.titleCase()}} Page'),
        ),
        body: const Center(
          child: Text('{{name.titleCase()}} Page'),
        ),
      ),
    );
  }
}
