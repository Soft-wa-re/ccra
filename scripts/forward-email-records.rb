#!/usr/bin/env ruby

require "yaml"

config_path = File.expand_path("../_data/ccra.yml", __dir__)
config = YAML.safe_load_file(config_path, aliases: true)
forwarding = config.fetch("email_forwarding")
domain = forwarding.fetch("domain")
group_aliases = forwarding.fetch("group_aliases")
leaders = config.fetch("leadership").fetch("members")

mailboxes = leaders.each_with_object({}) do |leader, routes|
  email = leader["email"]
  next unless email

  alias_name = email.fetch("alias")
  if routes.key?(alias_name)
    abort "Duplicate email alias '#{alias_name}' in leadership members."
  end

  routes[alias_name] = email.fetch("forwards_to")
end

mailbox_order = group_aliases.values.flatten.uniq
mailbox_order.concat(mailboxes.keys - mailbox_order)

records = [mailbox_order.map do |alias_name|
  destination = mailboxes.fetch(alias_name) do
    abort "Unknown mailbox '#{alias_name}' in group aliases."
  end

  "#{alias_name}:#{destination}"
end]

group_aliases.each do |alias_name, recipients|
  records << recipients.map do |recipient|
    unless mailboxes.key?(recipient)
      abort "Unknown mailbox '#{recipient}' in group alias '#{alias_name}'."
    end

    "#{alias_name}:#{recipient}@#{domain}"
  end
end

records.each do |routes|
  puts "forward-email=#{routes.join(',')}"
end
