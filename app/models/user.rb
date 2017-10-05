class User < ApplicationRecord

  def to_param
    "#{id}-#{name}"
  end

end
