class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :order_histories

  validates :nickname, presence: true
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, allow_blank: true }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, allow_blank: true }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, allow_blank: true }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, allow_blank: true }
  validates :birth_date, presence: true
  validates :password, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/, allow_blank: true }

  # 以下のようにカスタムのバリデーションメソッドを使用した書き方もできる。
  # テストコードの書き換えが必要

  # validates :nickname, presence: { message: "ニックネームは必須です" }
  # validate :first_name_format
  # validate :last_name_format
  # validate :first_name_kana_format
  # validate :last_name_kana_format
  # validates :birth_date, presence: { message: "生年月日は必須です" }

  # def first_name_format
  #   if first_name.blank?
  #     errors.add(:first_name, "お名前（名前）は必須です")
  #   elsif !first_name.match?(/\A[ぁ-んァ-ン一-龥々ー]+\z/)
  #     errors.add(:first_name, "お名前は全角（漢字・ひらがな・カタカナ）で入力してください")
  #   end
  # end
  
  # def last_name_format
  #   if last_name.blank?
  #     errors.add(:last_name, "お名前（苗字）は必須です")
  #   elsif !last_name.match?(/\A[ぁ-んァ-ン一-龥々ー]+\z/)
  #     errors.add(:last_name, "お名前は全角（漢字・ひらがな・カタカナ）で入力してください")
  #   end
  # end
  
  # def first_name_kana_format
  #   if first_name_kana.blank?
  #     errors.add(:first_name_kana, "お名前カナ（名前）は必須です")
  #   elsif !first_name_kana.match?(/\A[ァ-ヶー－]+\z/)
  #     errors.add(:first_name_kana, "お名前カナは全角カタカナで入力してください")
  #   end
  # end
  
  # def last_name_kana_format
  #   if last_name_kana.blank?
  #     errors.add(:last_name_kana, "お名前カナ（苗字）は必須です")
  #   elsif !last_name_kana.match?(/\A[ァ-ヶー－]+\z/)
  #     errors.add(:last_name_kana, "お名前カナは全角カタカナで入力してください")
  #   end
  # end

end