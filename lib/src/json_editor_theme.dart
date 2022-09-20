// Copyright (c) 2022, the json_editor project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

import 'rich_text_field/highlight_theme/json_theme_text.dart';

class JsonEditorTheme extends InheritedWidget {
  const JsonEditorTheme(
      {Key? key, required this.themeData, required Widget child})
      : super(key: key, child: child);

  final JsonEditorThemeData themeData;
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static JsonEditorThemeData? of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<JsonEditorTheme>()?.themeData;
}

class JsonEditorThemeData {
  JsonEditorThemeData({required this.lightTheme, this.darkTheme});

  factory JsonEditorThemeData.defaultTheme() => JsonEditorThemeData(
        lightTheme: JsonThemeText.light(),
        darkTheme: JsonThemeText.dark(),
      );

  final JsonThemeText lightTheme;
  final JsonThemeText? darkTheme;

  JsonThemeText theme(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.dark) {
      return darkTheme ?? lightTheme;
    } else {
      return lightTheme;
    }
  }
}
