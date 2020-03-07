require 'hanami/interactor'

module BooksInteractor
  class AddBook
    include Hanami::Interactor
    expose :book

    def initialize(params)
      @attributes = {
        title: params[:books][:title],
        author: params[:books][:author]
      }
      @book = nil
      @errors = []
    end

    def call
      @book = BookRepository.new.create(@attributes)
    end
  end
end
