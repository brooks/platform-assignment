file = File.read(Rails.root.join('db', 'project-data-07-30.json'))
users = JSON.parse(file)

# mass insert json data into users table in batches
users.each_slice(5000) do |batch|
  # normalize phone numbers
  batch.each{|user| user["phone"] = user["phone"].gsub(/.*(\d{3}).*(\d{3}).*(\d{4}).*/, '\1-\2-\3')}
  # create sql values string
  batch.map!{|user| "(\"#{user.values.join("\", \"")}\")" }
  sql = "INSERT INTO users (name, line1, line2, city, state, zip, phone) VALUES #{batch.join(", ")}"
  User.connection.execute sql
end