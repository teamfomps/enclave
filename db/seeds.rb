[Member].each do |collection|
  collection.delete_all
end

def create_member(opts = {})
  attributes = opts.reverse_merge(
    password: '12345678',
    confirmed_at: Time.zone.now
  )
  Member.create!(attributes)
end

stephen = create_member(
  first_name: 'Stephen',
  last_name: 'Van Dahm',
  handle: 'stephen',
  email: 'stephen@example.com',
  role: :admin,
)

nelson = create_member(
  first_name: 'Chris',
  last_name: 'Nelson',
  handle: 'fomps',
  email: 'chris@example.com',
  role: :admin,
)

joe = create_member(
  first_name: 'Joe',
  last_name: 'Juba',
  handle: 'joe',
  email: 'joe@example.com',
  role: 'member',
)

pj = create_member(
  first_name: 'PJ',
  last_name: 'Jabhouse',
  handle: 'pj.jabhouse',
  email: 'pj@example.com',
  role: 'applicant',
)

# Create Some Private Messages

5.times do
  joe.send_message([stephen], Faker::Hipster.paragraphs(2).join("\n\n"), Faker::Hipster.sentence(8))
  stephen.send_message([nelson], Faker::Hipster.paragraphs(2).join("\n\n"), Faker::Hipster.sentence(8))
end

