# a temporary monkeypatch to debug issue with setup_purchse
module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module PaypalCommonAPI

      def commit(action, request)
        puts "PayPal REQUEST DEBUG: #{action} "
        puts "#{request.inspect}"
        response = parse(action, ssl_post(endpoint_url, build_request(request), @options[:headers]))
        puts "#{response.inspect}"
        build_response(successful?(response), message_from(response), response,
          :test => test?,
          :authorization => authorization_from(response),
          :fraud_review => fraud_review?(response),
          :avs_result => { :code => response[:avs_code] },
          :cvv_result => response[:cvv2_code]
        )
      end

    end
  end
end
