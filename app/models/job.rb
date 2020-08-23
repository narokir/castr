# == Schema Information
#
# Table name: jobs
#
#  id                   :bigint           not null, primary key
#  company_name         :string
#  listing_expires      :datetime
#  payment              :string
#  payment_detials      :text
#  shoot_date           :datetime
#  shoot_location       :string
#  special_instructions :text
#  title                :string
#  union_status         :string
#  url                  :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  member_id            :bigint           not null
#
# Indexes
#
#  index_jobs_on_member_id  (member_id)
#
# Foreign Keys
#
#  fk_rails_...  (member_id => members.id)
#
class Job < ApplicationRecord
  belongs_to :member
  has_rich_text :description
  has_one_attached :production_image

  def acceptable_image
    return unless production_image.attached?

    errors.add(:production_image, 'is nil') if production_image.attached?.nil?

    errors.add(:production_image, 'is too big') unless production_image.byte_size <= 1.megabyte

    acceptable_types = ['image/jpeg', 'image/png']
    errors.add(:production_image, 'must be JPEG or PNG') unless acceptable_types.include?(production_image.content_type)
  end
end
