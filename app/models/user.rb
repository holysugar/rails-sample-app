class User < ApplicationRecord

  has_one :bookshelf
  has_many :books, through: :bookshelves

  def to_param
    "#{id}-#{name}"
  end

end
