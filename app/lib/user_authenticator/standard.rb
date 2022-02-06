# frozen_string_literal: true

# rubocop:disable Style/ClassAndModuleChildren
class UserAuthenticator::Standard
  class AuthenticationError < StandardError; end

  attr_reader :user

  def initialize(login, password)
    @login = login
    @password = password
  end

  def perform
    raise AuthenticationError if login.blank? || password.blank?
    raise AuthenticationError unless User.exists?(login: login)

    user = User.find_by(login: login)

    raise AuthenticationError unless user.password == password

    @user = user
  end

  private

  attr_reader :login, :password
end
# rubocop:enable Style/ClassAndModuleChildren
