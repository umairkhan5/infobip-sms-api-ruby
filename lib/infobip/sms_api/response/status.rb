module Infobip
  module SmsApi
    module Response
      class Status
        attr_reader :group_id, :group_name, :id, :name, :description

        def initialize(attributes)
          @group_id = attributes['groupId']
          @group_name = attributes['groupName']
          @id = attributes['id']
          @name = attributes['name']
          @description = attributes['description']
        end
      end
    end
  end
end