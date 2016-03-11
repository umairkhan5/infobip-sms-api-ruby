require 'json'

module Infobip
  module SmsApi
    class Base

      def to_hash
        hash = {}
        self.instance_variables.each do |var|
          value = self.instance_variable_get(var)
          hash[var.to_s.delete('@')] = value.respond_to?(:to_hash) ? value.to_hash : value
        end
        hash
      end

      def to_json
        self.to_hash.to_json
      end

    end
  end
end
