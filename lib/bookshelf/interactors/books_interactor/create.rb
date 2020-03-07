require 'hanami/interactor'

module BooksInteractor
  class Create
    include Hanami::Interactor

    def initialize(params)
      @attributes = {
        title: params[:books][:title],
        author: params[:books][:author]
      }
    end

    def call
      BookRepository.new.create(@attributes)
    end
  end
end
