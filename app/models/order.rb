# NOTE: 通常は order リソースも永続化すべきだが、
# ActiveRecord じゃないリソース例としてあえて永続化しない
class Order
  include ActiveModel::Model

  attr_accessor :user_id, :book_id, :number

  def save!
    ActiveRecord::Base.transaction do
      o = Ownership.find_or_create_by!(user: user, book: book) { |o| o.number = 0 }
      user.lock!
      o.lock!
      o.number += number.to_i
      user.money -= book.price
      o.save!
      user.save!
    end
  end

  def save
    save!
  rescue => e
    errors.add(:book_id, 'something wrong')
    Rails.logger.error e
    false
  end

  def user
    @user ||= User.find(user_id) if user_id
    @user ||= User.new
    @user
  end

  def book
    @book ||= Book.find(book_id) if book_id
    @book ||= Book.new
    @book
  end


  def persisted?
    false
  end

end
