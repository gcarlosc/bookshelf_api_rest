module Api
  module Serializers
    class User
      def call(user)
        serialize(user: map_user(user))
      end

      private

      def serialize(data)
        JSON.generate(data)
      end

      def map_user(user)
        {
          id: user.id,
          username: user.username
        }
      end
    end
  end
end
