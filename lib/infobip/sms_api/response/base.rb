module Infobip
  module SmsApi
    module Response
      class Base
        SUCCESSFUL_STATUSES = %w|PENDING ACCEPTED|
        attr_reader :messages, :status, :request_error, :data

        def initialize(status, attributes)
          @status = status
          @data = attributes
          case @status
            when 200
              @messages = []
              attributes['messages'].each do |message|
                @messages << Infobip::SmsApi::Response::Message.new(message)
              end
            when 401
              @request_error = attributes['requestError']
            else
          end
        end

        ##
        # Return true if all messages are successfully sent
        def successful?
          @messages && (@messages.collect(&:status).collect(&:group_name).uniq - SUCCESSFUL_STATUSES).size == 0
        end

        ##
        # Return the list of all failed messages
        def failed_messages
          @messages.select { |message|
            !SUCCESSFUL_STATUSES.include?message.status.group_name
          }
        end

        ##
        # Return the list of all sent messages
        def sent_messages
          @messages.select { |message|
            SUCCESSFUL_STATUSES.include?message.status.group_name
          }
        end
      end
    end
  end
end