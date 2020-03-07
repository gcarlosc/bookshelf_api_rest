module Api
  module Controllers
    module Books
      class Index
        include Api::Action
        accept :json

        def call(params)
          books = BookRepository.new.all
          self.body = response_body(books)
          self.status = 201
        rescue => e
          self.status = 400
          @error = e
        end

        def response_body(books)
          JSON.dump(books.map{|book| book.to_h})
        end
      end
    end
  end
end
