require 'hanami/interactor'

module UsersInteractor
  class SignUp
    include Hanami::Interactor
    expose :user

    def initialize(params)
      @user_repository = UserRepository.new
      @password_service = BCrypt::Password
      @attributes = {
        username: params[:user][:username],
        password: params[:user][:password]
      }
    end

    def call
      @user = @user_repository.create(
        user_params_with_password_digest(@attributes)
      )
    rescue => e
      error! e.message
    end

    private

    def user_params_with_password_digest(user_params)
      {
        username: user_params[:username],
        password_digest: encrypted_password(user_params[:password]),
      }
    end

    def encrypted_password(password)
      @password_service.create(password)
    end
  end
end
