class Order < ApplicationRecord
  belongs_to :donor

  def self.recent(max = 5)
    limit(max).order(created_at: :desc)
  end
end
