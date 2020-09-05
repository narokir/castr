# == Schema Information
#
# Table name: jobs
#
#  id                   :bigint           not null, primary key
#  company_name         :string
#  description          :text
#  featured             :boolean          default(FALSE)
#  listing_expires      :datetime
#  payment              :string
#  payment_detials      :text
#  shoot_end_date       :datetime
#  shoot_location       :string
#  shoot_start_date     :datetime
#  special_instructions :text
#  status               :string           default("pending")
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
  # has_rich_text :description
  has_one_attached :production_image
  validate :acceptable_image
  validates :title, presence: true
  validates :description, presence: true
  validates :shoot_start_date, presence: true
  validates :shoot_end_date, presence: true
  validates :shoot_location, presence: true

  UNION_STATUS = ["Any", "SAG", "SAG-AFTRA", "Nonunion"]

  def acceptable_image
    return unless production_image.attached?
    errors.add(:production_image, "is nil") if production_image.attached?.nil?
    errors.add(:production_image, "is too big") unless production_image.byte_size <= 1.megabyte
    acceptable_types = ["image/jpeg", "image/png"]
    errors.add(:production_image, "must be JPEG or PNG") unless acceptable_types.include?(production_image.content_type)
  end

  def some_image
    "https://dummyimage.com/800x600/f0f0f0/d4d4d4"
  end
end
