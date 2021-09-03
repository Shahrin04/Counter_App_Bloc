import 'package:bloc_tut/Logic/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Settings extends StatefulWidget {
  final String title;
  final Color color;

  const Settings({Key key, @required this.title, @required this.color})
      : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: widget.color,
      ),
      body: BlocConsumer<SettingsCubit, SettingsState>(
        listener: (context, state) {
          final notificationSnackBar = SnackBar(
              duration: Duration(seconds: 2),
              content: Text('App ' +
                  state.appNotification.toString().toUpperCase() +
                  ', Email ' +
                  state.emailNotification.toString().toUpperCase()));
          ScaffoldMessenger.of(context).showSnackBar(notificationSnackBar);
        },
        builder: (context, state) {
          return Container(
              child: Column(
            children: [
              SwitchListTile(
                value: state.appNotification,
                onChanged: (newValue) => context
                    .read<SettingsCubit>()
                    .toggleAppNotification(newValue),
                //-----------------same--------------------
                // BlocProvider.of<SettingsCubit>(context)
                //     .toggleAppNotification(newValue),
                //-----------------same--------------------
                title: Text('App Notifications'),
              ),
              SwitchListTile(
                value: state.emailNotification,
                onChanged: (newValue) => context
                    .read<SettingsCubit>()
                    .toggleMessageNotification(newValue),
                title: Text('Message Notification'),
              ),
            ],
          ));
        },
      ),
    );
  }
}
