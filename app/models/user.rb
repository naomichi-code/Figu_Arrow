class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :image_icon
  has_many :posts
  has_many :arrows
  has_many :comments
  has_many :user_rooms
  has_many :rooms, through: :user_rooms
  has_many :chats
  has_many :group_rooms
  has_many :groups, through: :group_rooms
  has_many :group_chats
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy #followerフォローする人を取得
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy #followedフォローされる人を取得
  has_many :following_user, through: :follower, source: :followed #フォローしている人[follower]の中から自分にフォローされている人[followed]を探す（自分がフォローしている人）取得
  has_many :follower_user, through: :followed, source: :follower #フォローされている人[followed]の中から自分をフォローしている人を[follower]探す（自分をフォローしている人）取得

  #フォローする
  def follow(user_id)
    follower.create(followed_id: user_id)
  end
  #フォロー解除
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end
  #すでにフォロー済みであればtureを返す
  def following?(user)
    following_user.include?(user)
  end
end