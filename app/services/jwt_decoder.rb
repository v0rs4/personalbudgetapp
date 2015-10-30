class JWTDecoder
  include Service
  attr_accessor :token
  validates :token, presence: true

  def call
    @result = Hash[[:payload, :header].zip(decode)]
    @status = :ok
  rescue JWT::VerificationError
    @status = :invalid_token
  rescue JWT::DecodeError
    @status = :decode_error
  end

  private

  def decode
    deep_symbolize_keys!(JWT.decode(token, secret, true, options))
  end

  def secret
    Rails.application.secrets.secret_jwt
  end

  def options
    { algorithm: 'HS256'.freeze }
  end

  def deep_symbolize_keys!(arr)
    arr.map! { |o| o.is_a?(Hash) ? o.deep_symbolize_keys! : o }
  end
end

