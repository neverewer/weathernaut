import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart' as geolocator;
import 'package:weathernaut/src/core/presentation/widgets/error_button.dart';
import 'package:weathernaut/src/core/presentation/widgets/error_image.dart';
import 'package:weathernaut/src/core/presentation/widgets/error_text.dart';
import 'package:weathernaut/src/core/utils/exceptions/network_exceptions.dart';
import 'package:weathernaut/src/core/utils/extensions/context_extension.dart';

class FailtureWidget extends StatelessWidget {
  final Object? error;
  final Function()? errorButtonCallback;

  const FailtureWidget({
    super.key,
    this.error,
    this.errorButtonCallback,
  });

  String getErrorMessage(Object? err, BuildContext context) {
    if (err == null) {
      return context.localization.unknownErrorMessage;
    }

    switch (err.runtimeType) {
      case geolocator.PermissionDeniedException:
        return context.localization.locationPermissionDeniedErrorMessage;
      case geolocator.LocationServiceDisabledException:
        return context.localization.locationServiceDisabledErrorMessage;
      case NetworkException:
        return context.localization.networkErrorMessage;
      default:
        return context.localization.unknownErrorMessage;
    }
  }

  @override
  Widget build(BuildContext context) {
    var errorMessage = getErrorMessage(error, context);

    return Scaffold(
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30, left: 40, right: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const ErrorImage(),
              ErrorText(text: errorMessage),
              const Spacer(),
              ErrorButton(onPressed: errorButtonCallback),
            ],
          ),
        ),
      ),
    );
  }
}
