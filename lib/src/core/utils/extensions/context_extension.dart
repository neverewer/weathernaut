import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:flutter_gen/gen_l10n/localizations_en.dart';

extension ContextExtension on BuildContext {
  AppLocalizations get localization => AppLocalizations.of(this) ?? AppLocalizationsEn();
}
