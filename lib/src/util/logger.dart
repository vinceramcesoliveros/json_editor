// Copyright (c) 2022, the json_editor project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/foundation.dart';

bool _openDebug = false;
void initialLogger({bool openDebug = false}) {
  _openDebug = openDebug;
}

void debug({String? tag, Object? object, String? message}) {
  var tagStr = tag ?? '';
  if (object != null) {
    tagStr += '(${object.runtimeType.toString()})';
  }
  _dPrint('$tagStr: ${message ?? ''}');
}

void warn({String? tag, Object? object, String? message}) {
  var tagStr = tag ?? '';
  if (object != null) {
    tagStr += '(${object.runtimeType.toString()})';
  }
  _dPrint('$tagStr: ${message ?? ''}');
}

void info({String? tag, Object? object, String? message}) {
  var tagStr = tag ?? '';
  if (object != null) {
    tagStr += '(${object.runtimeType.toString()})';
  }
  _dPrint('$tagStr: ${message ?? ''}');
}

void error(
    {String? tag,
    Object? object,
    String? message,
    Object? err,
    StackTrace? trace}) {
  var tagStr = tag ?? '';
  if (object != null) {
    tagStr += '(${object.runtimeType.toString()})';
  }
  _dPrint('$tagStr: ${message ?? ''}, $err,$trace');
}

void _dPrint(Object e) {
  if (_openDebug) {
    if (kDebugMode) {
      print(e);
    }
  }
}
