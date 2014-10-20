require File.expand_path('../../../test_helper', __FILE__)

class PayULatamTest < Test::Unit::TestCase
  def setup
    @gateway = PayULatamGateway.new(
        merchant_id: '12345',
        api_login: 'login',
        api_key:   'password',
        country_account_id: 'abcde'
    )

    @credit_card = credit_card
    @amount      = 300

    @options = {
        order_id:        '1',
        billing_address: address,
        language:        'en',
        description:     'Store Purchase'
    }
  end

  def test_successful_purchase
    @gateway.expects(:ssl_post).returns(successful_purchase_response)

    response = @gateway.purchase(@amount, @credit_card, @options)
    assert_success response

    assert_equal '00000000', response.authorization
    assert response.test?
  end

  def test_failed_purchase
    @gateway.expects(:ssl_post).returns(failed_purchase_response)

    response = @gateway.purchase(@amount, @credit_card, @options)
    assert_failure response
  end

  def test_successful_authorize
  end

  def test_failed_authorize
  end

  def test_successful_capture
  end

  def test_failed_capture
  end

  def test_successful_refund
  end

  def test_failed_refund
  end

  def test_successful_void
  end

  def test_failed_void
  end

  def test_successful_verify
  end

  def test_successful_verify_with_failed_void
  end

  def test_failed_verify
  end

  private

  def successful_purchase_response
    "{\"code\":\"SUCCESS\",\"error\":null,\"transactionResponse\":{\"orderId\":3018500,\"transactionId\":\"b5369274-4b51-4cd3-a634-61db79b3eb9c\",\"state\":\"APPROVED\",\"paymentNetworkResponseCode\":null,\"paymentNetworkResponseErrorMessage\":null,\"trazabilityCode\":\"00000000\",\"authorizationCode\":\"00000000\",\"pendingReason\":null,\"responseCode\":\"APPROVED\",\"errorCode\":null,\"responseMessage\":null,\"transactionDate\":null,\"transactionTime\":null,\"operationDate\":1393966959622,\"extraParameters\":null}}"
  end

  def failed_purchase_response
    "{\"code\":\"SUCCESS\",\"error\":null,\"transactionResponse\":{\"orderId\":3018500,\"transactionId\":\"b5369274-4b51-4cd3-a634-61db79b3eb9c\",\"state\":\"DECLINED\",\"paymentNetworkResponseCode\":null,\"paymentNetworkResponseErrorMessage\":null,\"trazabilityCode\":null,\"authorizationCode\":null,\"pendingReason\":null,\"responseCode\":\"ENTITY_DECLINED\",\"errorCode\":null,\"responseMessage\":null,\"transactionDate\":null,\"transactionTime\":null,\"operationDate\":null,\"extraParameters\":null}}"
  end

  def successful_authorize_response
    successful_purchase_response
  end

  def failed_authorize_response
    failed_purchase_response
  end

  def successful_capture_response
  end

  def failed_capture_response
  end

  def successful_refund_response
  end

  def failed_refund_response
  end

  def successful_void_response
  end

  def failed_void_response
  end
end
