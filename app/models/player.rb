class Player < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :tournaments
  has_many :players_tournaments
  has_many :tournaments, through: :players_tournaments
  has_many :billings

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |player|
    player.email = auth.info.email
    player.password = Devise.friendly_token[0,20]
    player.name = auth.info.name
    end
  end
end
