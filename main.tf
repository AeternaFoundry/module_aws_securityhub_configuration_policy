resource "aws_securityhub_configuration_policy" "securityhub_configuration_policies" {
  for_each = var.securityhub_configuration_policies

  name        = each.value.name
  description = each.value.description
  region      = each.value.region

  configuration_policy {
    enabled_standard_arns = each.value.configuration_policy.enabled_standard_arns
    dynamic "security_controls_configuration" {
      for_each = each.value.configuration_policy.security_controls_configuration != null ? [each.value.configuration_policy.security_controls_configuration] : []
      content {
        disabled_control_identifiers = security_controls_configuration.value.disabled_control_identifiers
        enabled_control_identifiers  = security_controls_configuration.value.enabled_control_identifiers
        dynamic "security_control_custom_parameter" {
          for_each = security_controls_configuration.value.security_control_custom_parameter != null ? security_controls_configuration.value.security_control_custom_parameter : []
          content {
            dynamic "parameter" {
              for_each = security_control_custom_parameter.value.parameter
              content {
                dynamic "bool" {
                  for_each = parameter.value.bool != null ? [parameter.value.bool] : []
                  content {
                    value = bool.value.value
                  }
                }
                dynamic "double" {
                  for_each = parameter.value.double != null ? [parameter.value.double] : []
                  content {
                    value = double.value.value
                  }
                }
                dynamic "enum" {
                  for_each = parameter.value.enum != null ? [parameter.value.enum] : []
                  content {
                    value = enum.value.value
                  }
                }
                dynamic "enum_list" {
                  for_each = parameter.value.enum_list != null ? [parameter.value.enum_list] : []
                  content {
                    value = enum_list.value.value
                  }
                }
                dynamic "int" {
                  for_each = parameter.value.int != null ? [parameter.value.int] : []
                  content {
                    value = int.value.value
                  }
                }
                dynamic "int_list" {
                  for_each = parameter.value.int_list != null ? [parameter.value.int_list] : []
                  content {
                    value = int_list.value.value
                  }
                }
                name = parameter.value.name
                dynamic "string" {
                  for_each = parameter.value.string != null ? [parameter.value.string] : []
                  content {
                    value = string.value.value
                  }
                }
                dynamic "string_list" {
                  for_each = parameter.value.string_list != null ? [parameter.value.string_list] : []
                  content {
                    value = string_list.value.value
                  }
                }
                value_type = parameter.value.value_type
              }
            }
            security_control_id = security_control_custom_parameter.value.security_control_id
          }
        }
      }
    }
    service_enabled = each.value.configuration_policy.service_enabled
  }
}

