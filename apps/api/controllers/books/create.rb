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

          interactor_result = BooksInteractor::AddBook.new(params).call
          self.body = JSON.dump(interactor_result.book.to_hash)
          self.status = 201
        rescue => e
          self.status = 400
          self.body = JSON.dump(interactor_result.messages)
        end
      end
    end
  end
end
