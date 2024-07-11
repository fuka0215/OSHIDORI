class Post < ApplicationRecord

  has_one_attached :image
  belongs_to :user
  has_many :post_comments, dependent: :destroy

  validates :title, :body, :image, presence: true
  validates :title, length: { maximum: 20 }
  validates :body, length: { maximum: 160 }

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

end
