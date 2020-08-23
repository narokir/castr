# == Schema Information
#
# Table name: members
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean          default(FALSE)
#  castr                  :boolean          default(FALSE)
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  provider               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  talent                 :boolean          default(FALSE)
#  uid                    :string
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_members_on_confirmation_token    (confirmation_token) UNIQUE
#  index_members_on_email                 (email) UNIQUE
#  index_members_on_reset_password_token  (reset_password_token) UNIQUE
#
class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :trackable,
         :omniauthable, omniauth_providers: %i[facebook]

  has_one_attached :profile_image
  has_many :jobs, dependent: :destroy
  validate :acceptable_image

  def acceptable_image
    return unless profile_image.attached?

    errors.add(:profile_image, 'is nil') if profile_image.attached?.nil?

    errors.add(:profile_image, 'is too big') unless profile_image.byte_size <= 1.megabyte

    acceptable_types = ['image/jpeg', 'image/png']
    errors.add(:profile_image, 'must be JPEG or PNG') unless acceptable_types.include?(profile_image.content_type)
  end

  def self.from_omniauth(auth)
    member = find_or_initialize_by(provider: auth.provider, uid: auth.uid)
    member.email = auth.info.email
    member.password = Devise.friendly_token[0, 20]
    member.first_name = auth.info.name.split(' ').first
    member.last_name = auth.info.name.split(' ').last
    # member.profile_img = auth.info.image # assuming the member model has an image
    # If you are using confirmable and the provider(s) you use validate emails,
    # uncomment the line below to skip the confirmation emails.
    # user.skip_confirmation!
    member.save!
    member
  end

  def password_required?
    provider.blank?
  end

  # Overwrite devise update without password method
  def update_without_password(params, *options)
    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end
end
