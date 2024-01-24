

import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/presentation/pages/create_site/create_site_bloc.dart';
import 'package:uq_system_app/presentation/pages/create_site/create_site_selector.dart';

class DetailsTab extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final CreateSiteBloc _bloc = BlocProvider.of<CreateSiteBloc>(context);
    return Container();
  }

}