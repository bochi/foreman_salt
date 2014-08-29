# Create feature for Smart Proxy
Feature.find_or_create_by_name("Salt")

# Seed our permissions
permissions = [
  %w(Host saltrun_hosts),
  %w(Host view_hosts),
  %w(ForemanSalt::SaltModule create_salt_modules),
  %w(ForemanSalt::SaltModule view_salt_modules),
  %w(ForemanSalt::SaltModule edit_salt_modules),
  %w(ForemanSalt::SaltModule destroy_salt_modules),
  %w(SmartProxy view_smart_proxies_salt_keys),
  %w(SmartProxy destroy_smart_proxies_salt_keys),
  %w(SmartProxy edit_smart_proxies_salt_keys),
  %w(SmartProxy destroy_smart_proxies_salt_autosign),
  %w(SmartProxy create_smart_proxies_salt_autosign),
  %w(SmartProxy view_smart_proxies_salt_autosign),
]

permissions.each do |resource, permission|
  Permission.find_or_create_by_resource_type_and_name resource, permission
end
