json.extract! job, :id, :title, :description, :company_name, :listing_expires, :url, :union_status, :payment, :payment_detials, :shoot_date, :shoot_location, :special_instructions, :member_id, :created_at, :updated_at
json.url job_url(job, format: :json)
