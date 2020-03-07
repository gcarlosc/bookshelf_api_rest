require 'hanami/validations'

module Form
  class BooksValidator
    include Hanami::Validations

    validations do
      required(:books).schema do
        required(:title) { filled? & str? }
        required(:author) { filled? & str? }
      end
    end
  end
end
