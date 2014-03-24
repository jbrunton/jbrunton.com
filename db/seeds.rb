# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

3.times do |k|
  Timecop.travel(DateTime.now - k) do
    BlogPost.create(
      title: Faker::Lorem.sentence,
      jump: Faker::Lorem.paragraph(5),
      body: 3.times.map { Faker::Lorem.paragraph(5) }.join("\n\n")
    )
  end
end

3.times do |k| Page.create(
    title: Faker::Lorem.words(2).map(&:capitalize).join(' '),
    content: 3.times.map { Faker::Lorem.paragraph(5) }.join("\n\n")
  )
end
