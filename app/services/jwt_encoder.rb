class JWTEncoder
  include Service

  attr_accessor :data
  attr_accessor :claims

  validates :data, presence: true

  default :claims, {}

  def call
    @result = { token: JWT.encode(payload, secret, algorithm) }
    @status = :ok
  end

  private

  def payload
    data.merge(claims)
  end

  def secret
    Rails.application.secrets.secret_jwt
  end

  def algorithm
    'HS256'.freeze
  end
end
