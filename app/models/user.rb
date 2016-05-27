class User < ActiveRecord::Base
  mount_uploader :picture, PictureUploader

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :current_city, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
            presence:   true,
            format:     { with: VALID_EMAIL_REGEX },
            uniqueness: true,
            length:     { maximum: 255 }
  validates :password_digest, presence: true, length: { minimum: 6 }

  has_secure_password
  has_many :posts

  has_many :cities

  def self.confirm(params)
    @user = User.find_by({ email: params[:email]})
    @user.try(:authenticate, params[:password])
  end

  #   has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  #   validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
