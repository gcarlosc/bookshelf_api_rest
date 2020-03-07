require 'hanami/validations'

module Form
  class BooksValidator
    include Hanami::Validations

    validations do
      required(:books).schema do
        required(:title) { filled? }
        required(:author) { filled? }
      end
    end
  end
end
