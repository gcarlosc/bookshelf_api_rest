# apps/web/controllers/books/create.rb
module Api
  module Controllers
    module Books
      class Create
        include Api::Action
        accept :json

        def call(params)
          validate_result = Form::BooksValidator.new(params).validate
          raise StandardError unless validate_result.success?

          book = BooksInteractor.new.create(attribute)
          self.body = response_body(book)
          self.status = 201
        rescue => exception
          self.status = 400
          @error = exception
        end

        def response_body(book)
          JSON.dump(book.to_hash)
        end
      end
    end
  end
end
