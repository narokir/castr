# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p "Deleting all Members"
Member.delete_all
p "Deleting all Jobs"
Job.delete_all

castr = Member.new(email: "castr1@botmail.com", password: "password", password_confirmation: "password", first_name: "castr1", last_name: "castr1lastname", admin: false, talent: false, castr: true)
castr.save!
p "Created castr"
admin = Member.new(email: "admin@botmail.com", password: "password", password_confirmation: "password", first_name: "admin1", last_name: "admin1lastname", admin: true, talent: false, castr: false)
admin.save!
p "Created Admin"
talent = Member.new(email: "talent1@botmail.com", password: "password", password_confirmation: "password", first_name: "talent1", last_name: "talent1lastname", admin: false, talent: true, castr: false)
talent.save!
p "Created talent"

3.times do |index|
  job = Job.create!(
    title: Faker::Movie.title,
    company_name: Faker::Company.name,
    description: Faker::Lorem.paragraph(sentence_count: 9, supplemental: false, random_sentences_to_add: 4),
    union_status: "SAG",
    payment: "$125/day",
    shoot_location: "Albuquerque",
    payment_details: Faker::Lorem.paragraph(sentence_count: 4),
    shoot_start_date: Faker::Date.forward(days: 13),
    shoot_end_date: Faker::Date.forward(days: 13),
    listing_expires: Faker::Date.forward(days: 43),
    member_id: castr.id,
    # main_image: Faker::LoremPixel.image(size: "300x300"),
  )
  job.save
end
3.times do |index|
  job = Job.create!(
    title: Faker::Movie.title,
    company_name: Faker::Company.name,
    description: Faker::Lorem.paragraph(sentence_count: 9, supplemental: false, random_sentences_to_add: 4),
    union_status: "Nonunion",
    payment: "$92/8",
    shoot_location: "Santa Fe",
    payment_details: Faker::Lorem.paragraph(sentence_count: 4),
    shoot_start_date: Faker::Date.forward(days: 23),
    shoot_end_date: Faker::Date.forward(days: 23),
    listing_expires: Faker::Date.forward(days: 43),
    member_id: admin.id,
    featured: true,
    # main_image: Faker::LoremPixel.image(size: "300x300"),
  )
  job.save
end
3.times do |index|
  job = Job.create!(
    title: Faker::Movie.title,
    company_name: Faker::Company.name,
    description: Faker::Lorem.paragraph(sentence_count: 9, supplemental: false, random_sentences_to_add: 4),
    union_status: "Any",
    payment: "$92/8",
    shoot_location: "Placitas,NM",
    payment_details: Faker::Lorem.paragraph(sentence_count: 4),
    shoot_start_date: Faker::Date.forward(days: 33),
    shoot_end_date: Faker::Date.forward(days: 43),
    listing_expires: Faker::Date.forward(days: 43),
    member_id: castr.id,
    # main_image: Faker::LoremPixel.image(size: "300x300"),
  )
  job.save
end
3.times do |index|
  job = Job.create!(
    title: Faker::Movie.title,
    company_name: Faker::Company.name,
    description: Faker::Lorem.paragraph(sentence_count: 9, supplemental: false, random_sentences_to_add: 4),
    union_status: "Nonunion",
    payment: "$150/day",
    shoot_location: "Las Vegas,NM",
    payment_details: Faker::Lorem.paragraph(sentence_count: 4),
    shoot_start_date: Faker::Date.forward(days: 83),
    shoot_end_date: Faker::Date.forward(days: 83),
    listing_expires: Faker::Date.forward(days: 43),
    member_id: talent.id,
    featured: true,
    # main_image: Faker::LoremPixel.image(size: "300x300"),
  )
  job.save
end
p "Created #{Member.count} Members"
# p "Created #{admin.count} admins"
# p "Created #{talent.count} BG Actors"
p "Created #{Job.count} Jobs"
