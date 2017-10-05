json.extract! bookshelf, :id, :user_id, :book_id, :number, :created_at, :updated_at
json.url bookshelf_url(bookshelf, format: :json)
