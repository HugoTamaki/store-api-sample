class ApiKey < ActiveRecord::Base
  before_create :generate_secret_key

  def secret_token
    "#{secret}:#{key}"
  end

  private

  def generate_secret_key
    self.secret = SecureRandom.hex
    self.key    = SecureRandom.hex
  end
end
