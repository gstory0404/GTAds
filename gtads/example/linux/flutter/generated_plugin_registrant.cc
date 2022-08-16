//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <gtads/gtads_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) gtads_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "GtadsPlugin");
  gtads_plugin_register_with_registrar(gtads_registrar);
}
