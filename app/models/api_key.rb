class ApiKey < ActiveRecord::Base
  before_create :generate_secret_key

  private

  def generate_secret_key
    self.secret = SecureRandom.hex
    self.key    = SecureRandom.hex
  end
end
