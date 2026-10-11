output "securityhub_configuration_policies_id" {
  description = "Map of id values across all securityhub_configuration_policies, keyed the same as var.securityhub_configuration_policies"
  value       = { for k, v in aws_securityhub_configuration_policy.securityhub_configuration_policies : k => v.id if v.id != null && length(v.id) > 0 }
}
output "securityhub_configuration_policies_arn" {
  description = "Map of arn values across all securityhub_configuration_policies, keyed the same as var.securityhub_configuration_policies"
  value       = { for k, v in aws_securityhub_configuration_policy.securityhub_configuration_policies : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "securityhub_configuration_policies_configuration_policy" {
  description = "Map of configuration_policy values across all securityhub_configuration_policies, keyed the same as var.securityhub_configuration_policies"
  value       = { for k, v in aws_securityhub_configuration_policy.securityhub_configuration_policies : k => one(v.configuration_policy) if v.configuration_policy != null && length(v.configuration_policy) > 0 }
}
output "securityhub_configuration_policies_description" {
  description = "Map of description values across all securityhub_configuration_policies, keyed the same as var.securityhub_configuration_policies"
  value       = { for k, v in aws_securityhub_configuration_policy.securityhub_configuration_policies : k => v.description if v.description != null && length(v.description) > 0 }
}
output "securityhub_configuration_policies_name" {
  description = "Map of name values across all securityhub_configuration_policies, keyed the same as var.securityhub_configuration_policies"
  value       = { for k, v in aws_securityhub_configuration_policy.securityhub_configuration_policies : k => v.name if v.name != null && length(v.name) > 0 }
}
output "securityhub_configuration_policies_region" {
  description = "Map of region values across all securityhub_configuration_policies, keyed the same as var.securityhub_configuration_policies"
  value       = { for k, v in aws_securityhub_configuration_policy.securityhub_configuration_policies : k => v.region if v.region != null && length(v.region) > 0 }
}

