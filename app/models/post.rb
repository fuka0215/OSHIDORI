class Post < ApplicationRecord

  has_one_attached :image
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :notifications, as: :notifiable, dependent: :destroy  

  geocoded_by :address
  after_validation :geocode

  validates :title, :body, :image, :address, presence: true
  validates :title, length: { maximum: 20 }
  validates :body, length: { maximum: 160 }
  validate :validate_address


  def self.search(title)
   if title
     Post.where(['title LIKE?', "%#{title}%"])
   else
      Post.all
   end
  end


  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image_square.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      image.variant(resize_to_limit: [width, height]).processed
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def validate_address
      geocoded = Geocoder.search(address)
    unless geocoded&.first&.coordinates.present?
      errors.add(:address, 'が存在しません') # 「住所が存在しません」と表示される
    end
  end
  
  after_create do
    user.followers.each do |follower|
      notifications.create(user_id: follower.id)
    end
  end
  
end
