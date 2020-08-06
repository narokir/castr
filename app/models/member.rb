class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :validatable,
         :trackable, :omniauthable, omniauth_providers: %i[facebook]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |member|
      member.email = auth.info.email
      member.password = Devise.friendly_token[0, 20]
      # member.name = auth.info.first_name
      # member.surname = auth.info.last_name
      # member.profile_img = auth.info.image # assuming the member model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end
end
