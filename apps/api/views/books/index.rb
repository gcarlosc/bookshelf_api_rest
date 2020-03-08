# apps/web/views/books/index.rb
module Api
  module Views
    module Books
      class Index
        include Api::View

        def render
          JSON.dump(
            books: books.map do |book|
              {
                id: book.id,
                title: book.title,
                author: book.author
              }
            end
          )
        end
      end
    end
  end
end
