# apps/web/controllers/books/create.rb
module Api
  module Controllers
    module Users
      class SignUp
        include Api::Action
        accept :json
        expose :user

        params do
          required(:user).schema do
            required(:username).filled(:str?)
            required(:password).filled(:str?)
          end
        end

        def call(params)
          halt 422 unless params.valid?
          interactor_result = UsersInteractor::SignUp.new(params).call
          rails StandardError unless interactor_result.success?
          @user = interactor_result.user
        rescue => e
          self.status = 400
          self.body = JSON.dump(errors: interactor_result.errors[0])
        end
      end
    end
  end
end
