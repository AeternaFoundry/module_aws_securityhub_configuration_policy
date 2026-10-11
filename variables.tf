variable "securityhub_configuration_policies" {
  description = <<EOT
Map of securityhub_configuration_policies, attributes below
Required:
    - name
    - configuration_policy (block):
        - enabled_standard_arns (optional)
        - security_controls_configuration (optional, block):
            - disabled_control_identifiers (optional)
            - enabled_control_identifiers (optional)
            - security_control_custom_parameter (optional, block):
                - parameter (required, block):
                    - bool (optional, block):
                        - value (required)
                    - double (optional, block):
                        - value (required)
                    - enum (optional, block):
                        - value (required)
                    - enum_list (optional, block):
                        - value (required)
                    - int (optional, block):
                        - value (required)
                    - int_list (optional, block):
                        - value (required)
                    - name (required)
                    - string (optional, block):
                        - value (required)
                    - string_list (optional, block):
                        - value (required)
                    - value_type (required)
                - security_control_id (required)
        - service_enabled (required)
Optional:
    - description
    - region
EOT

  type = map(object({
    name        = string
    description = optional(string)
    region      = optional(string)
    configuration_policy = object({
      enabled_standard_arns = optional(set(string))
      security_controls_configuration = optional(object({
        disabled_control_identifiers = optional(set(string))
        enabled_control_identifiers  = optional(set(string))
        security_control_custom_parameter = optional(list(object({
          parameter = list(object({
            bool = optional(object({
              value = bool
            }))
            double = optional(object({
              value = number
            }))
            enum = optional(object({
              value = string
            }))
            enum_list = optional(object({
              value = list(string)
            }))
            int = optional(object({
              value = number
            }))
            int_list = optional(object({
              value = list(number)
            }))
            name = string
            string = optional(object({
              value = string
            }))
            string_list = optional(object({
              value = list(string)
            }))
            value_type = string
          }))
          security_control_id = string
        })))
      }))
      service_enabled = bool
    })
  }))
  validation {
    condition = alltrue([
      for k, v in var.securityhub_configuration_policies : (
        v.configuration_policy.security_controls_configuration == null || (v.configuration_policy.security_controls_configuration.security_control_custom_parameter == null || alltrue([for item in v.configuration_policy.security_controls_configuration.security_control_custom_parameter : (length(item.parameter) >= 1)]))
      )
    ])
    error_message = "Each parameter list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.securityhub_configuration_policies : (
        v.configuration_policy.security_controls_configuration == null || (v.configuration_policy.security_controls_configuration.disabled_control_identifiers == null || (alltrue([for x in v.configuration_policy.security_controls_configuration.disabled_control_identifiers : length(x) > 0])))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.securityhub_configuration_policies : (
        v.configuration_policy.security_controls_configuration == null || (v.configuration_policy.security_controls_configuration.enabled_control_identifiers == null || (alltrue([for x in v.configuration_policy.security_controls_configuration.enabled_control_identifiers : length(x) > 0])))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.securityhub_configuration_policies : (
        v.configuration_policy.security_controls_configuration == null || (v.configuration_policy.security_controls_configuration.security_control_custom_parameter == null || alltrue([for item in v.configuration_policy.security_controls_configuration.security_control_custom_parameter : (length(item.security_control_id) > 0)]))
      )
    ])
    error_message = "must not be empty"
  }
  # Note: 6 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

