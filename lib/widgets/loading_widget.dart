import 'package:flash_scooters/styles.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 100,
          child: FlareActor(
            'assets/flare/loading.flr',
            animation: 'Alarm',
          ),
        ),
        Text(
          'Loading',
          style: loadingTextStyle,
        )
      ],
    );
  }
}
