class User < ApplicationRecord
  has_many :ownership
  has_many :books, through: :ownership

  def to_param
    "#{id}-#{name}"
  end

  def to_s
    "[#{id}]#{name}"
  end

  def to_key
    name
  end

end
