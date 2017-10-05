class User < ApplicationRecord
  has_many :ownership
  has_many :books, through: :ownership

  def to_param
    "#{id}-#{name}"
  end

end
