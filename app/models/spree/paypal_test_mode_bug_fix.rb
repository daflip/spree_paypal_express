# a temporary monkeypatch to debug issue with setup_purchse
module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module PaypalCommonAPI

      def test?
        Rails.env.development?
      end

    end
  end
end
