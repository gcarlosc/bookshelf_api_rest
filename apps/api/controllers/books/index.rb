module Api
  module Controllers
    module Books
      class Index
        include Api::Action
        expose :books

        def initialize
          @interactor = BooksInteractor::ListBooks.new
        end

        def call(params)
          result = @interactor.call
          @books = result.books
        end
      end
    end
  end
end
