require 'hanami/interactor'

module BooksInteractor
  class ListBooks
    include Hanami::Interactor
    expose :books

    def initialize
      @book_repository = BookRepository.new
    end

    def call
      @books = @book_repository.all
    end
  end
end
