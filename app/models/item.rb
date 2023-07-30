class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :scheduled_delivery
  belongs_to :prefecture
  has_one_attached :image
  belongs_to :user

  validates :image, presence: true
  validates :name, presence: true
  validates :info, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, only_integer: true }

  #選択が「---」の時は保存できないようにする
  validates :category_id, numericality: { greater_than_or_equal_to: 2, less_than_or_equal_to: 11, only_integer: true, message: "can't be blank" }
  validates :sales_status_id, numericality: { greater_than_or_equal_to: 2, less_than_or_equal_to: 7, only_integer: true, message: "can't be blank" }
  validates :shipping_fee_status_id, numericality: { greater_than_or_equal_to: 2, less_than_or_equal_to: 3, only_integer: true, message: "can't be blank" }
  validates :scheduled_delivery_id, numericality: { greater_than_or_equal_to: 2, less_than_or_equal_to: 4, only_integer: true, message: "can't be blank" }
  validates :prefecture_id, numericality: {greater_than_or_equal_to: 2, less_than_or_equal_to: 48, only_integer: true, message: "can't be blank" }

  def sold_out?
    history = OrderHistory.find_by(item_id: self.id)
    history.present?
  end

end
