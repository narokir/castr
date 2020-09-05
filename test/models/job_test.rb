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
require 'test_helper'

class JobTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
