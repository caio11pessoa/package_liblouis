// import 'dart:ffi';
// import 'package:ffi/ffi.dart';
// import 'dart:io';

// import 'liblouis_package_bindings_generated.dart';
import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';
// import 'package:path_provider/path_provider.dart';

import 'liblouis_package_bindings_generated.dart';

String louVersion() {
  final Pointer<Char> versionPointer = _bindings.lou_version();
  final String version = versionPointer.cast<Utf8>().toDartString();
  return version;
}

const String _libName = 'liblouis_package';

/// The dynamic library in which the symbols for [LiblouisPackageBindings] can be found.
final DynamicLibrary _dylib = () {
  if (Platform.isMacOS || Platform.isIOS) {
    return DynamicLibrary.open('$_libName.framework/$_libName');
  }
  if (Platform.isAndroid || Platform.isLinux) {
    return DynamicLibrary.open('lib$_libName.so');
  }
  if (Platform.isWindows) {
    return DynamicLibrary.open('$_libName.dll');
  }
  throw UnsupportedError('Unknown platform: ${Platform.operatingSystem}');
}();

/// The bindings to the native functions in [_dylib].
final LiblouisPackageBindings _bindings = LiblouisPackageBindings(_dylib);