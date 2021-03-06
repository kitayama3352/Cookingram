class Item < ApplicationRecord
  
   belongs_to :customer
   has_many :comments, dependent: :destroy
   attachment :image
   has_many :favorites, dependent: :destroy
   
  validates :name, presence: true
  validates :image, presence: true

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end

end
