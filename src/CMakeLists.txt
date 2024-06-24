# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

project(liblouis_package_library VERSION 0.0.1 LANGUAGES C)

add_library(liblouis_package SHARED
  "commonTranslationFunctions.c"
  "compileTranslationTable.c"
  "logging.c"
  "lou_backTranslateString.c"
  "lou_translateString.c"
  "maketable.c"
  "metadata.c"
  "pattern.c"
  "utils.c"
)


set_target_properties(liblouis_package PROPERTIES
  PUBLIC_HEADER "config.h;internal.h;liblouis.h"
  OUTPUT_NAME "liblouis_package"
)

target_compile_definitions(liblouis_package PUBLIC DART_SHARED_LIB)
