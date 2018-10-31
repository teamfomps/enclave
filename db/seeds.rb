def create_member(opts = {})
   attributes = opts.reverse_merge(
     password: '12345678',
     confirmed_at: Time.zone.now
   )
   Member.create!(attributes)
end

def translate_role(role)
  roles = {
    '3' => :member,
    '6' => :admin,
    '11' => :admin,
    '9' => :member,
    '21' => :sock_puppet,
    '20' => :sock_puppet
  }
  roles[role]
end

def translate_boolean(value)
  value == '1'
end

# Make sure the legacy Vanilla database exists before proceeding
db = Mysql2::Client.new(host: '127.0.0.1', username: 'stephen', database: 'vanilla')

[Member, Category, Discussion, Comment].each do |collection|
  collection.delete_all
end

### Members ###

rows = db.query('SELECT * FROM LUM_User')
rows.each do |row|
  m = create_member(
    id: row["UserID"].to_i,
    first_name: row["FirstName"],
    last_name: row['LastName'],
    handle: row['Name'],
    email: row['Email'],
    sign_in_count: row['CountVisit'].to_i,
    discussion_count: row['CountDiscussions'].to_i,
    comment_count: row['CountComments'].to_i,
    created_at: row['DateFirstVisit'],
    last_active_at: row['DateLastActive'],
    last_created_discussion_at: row['LastDiscussionPost'],
    last_created_comment_at: row['LastCommentPost'],
    role: translate_role(row['RoleID'])
  )
end

### Categories ###

rows = db.query('SELECT * FROM LUM_Category')
rows.each do |row|
  Category.create(id: row['CategoryID'],
                  name: row['Name'],
                  description: row['Description'],
                  priority: row['Priority'])
end

### Public Discussions ###
rows = db.query('SELECT * FROM LUM_Discussion WHERE CategoryID <> 11 AND WhisperUserID = 0')
rows.each do |row|
  d = Discussion.new
  d.id = row['DiscussionID']
  d.category_id = row['CategoryID']
  d.member_id = row['AuthUserID']
  d.name = row['Name']
  d.comment_count = row['CountComments'].to_i
  d.first_comment_id = row['FirstCommentID']
  d.is_active = translate_boolean(row['Active'])
  d.is_closed = translate_boolean(row['Closed'])
  d.is_sticky = translate_boolean(row['Sticky'])
  d.created_at = row['DateCreated']
  d.updated_at = row['DateLastActive']
  d.save!
end

### Public Comments ###
rows = db.query('SELECT * FROM LUM_Comment WHERE WhisperUserID = 0')
rows.each do |row|
  c = Comment.new
  c.id = row['CommentID']
  c.discussion_id = row['DiscussionID']
  c.member_id = row['AuthUserID']
  c.body = row['Body']
  c.format = row['FormatType']
  c.is_deleted = translate_boolean(row['Deleted'])
  if c.is_deleted
    c.deleted_at = row['DateDeleted']
  end
  c.created_at = row['DateCreated']
  c.updated_at = row['DateEdited']
  c.save!
end

# # Create Some Private Messages
#
# 5.times do
#   joe.send_message([stephen], Faker::Hipster.paragraphs(2).join("\n\n"), Faker::Hipster.sentence(8))
#   stephen.send_message([nelson], Faker::Hipster.paragraphs(2).join("\n\n"), Faker::Hipster.sentence(8))
# end
