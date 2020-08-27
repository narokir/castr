# == Schema Information
#
# Table name: jobs
#
#  id                   :bigint           not null, primary key
#  company_name         :string
#  featured             :boolean          default(FALSE)
#  listing_expires      :datetime
#  payment              :string
#  payment_detials      :text
#  shoot_date           :datetime
#  shoot_location       :string
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
require 'test_helper'

class JobTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
