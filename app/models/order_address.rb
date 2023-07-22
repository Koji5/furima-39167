class OrderAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :order_history

  #選択が「---」の時は保存できないようにする
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
end
