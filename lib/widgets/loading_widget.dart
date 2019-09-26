import 'package:flash_scooters/styles.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

///
/// A Widget that shows a loading indicator and text during the time that the information is loaded.
///
class LoadingWidget extends StatelessWidget {

  static const LOADING_WIDGET_HEIGHT = 100.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: LOADING_WIDGET_HEIGHT,
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
