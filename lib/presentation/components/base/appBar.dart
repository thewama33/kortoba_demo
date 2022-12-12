import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kortoba_demo/bloc/AuthsCubit/auths_cubit.dart';
import 'package:kortoba_demo/main.dart';
import '../../../core/appTheme.dart';

AppBar baseAppBar(context) {
  return AppBar(
    leading: BlocBuilder<AuthsCubit, AuthsState>(
      builder: (context, state) {
        return IconButton(
          icon: Icon(Icons.logout),
          onPressed: () {
            if (state is LogOutState) {
              context.read<AuthsCubit>().logOut();
              Navigator.pushNamed(
                  context, MainScreen.routeName);
            }
          },
        );
      },
    ),
    actions: [
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {},
      ),
    ],
    centerTitle: true,
    title: Text(
      "التصنيفات",
      style: textTheme().titleMedium?.copyWith(fontWeight: FontWeight.bold),
    ),
  );
}
