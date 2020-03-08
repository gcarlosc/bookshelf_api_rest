module Api
  module Views
    module Users
      class SignUp
        include Api::View

        def render
          _raw Api::Serializers::User.new.call(user)
        end
      end
    end
  end
end
