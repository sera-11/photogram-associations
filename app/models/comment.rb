# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer
#  photo_id   :integer
#

class Comment < ApplicationRecord
  validates(:commenter, { :presence => true })

  # Association accessor methods to define:
  
  ## Direct associations

  # Comment#commenter: returns a row from the users table associated to this comment by the author_id column
  #Comment has a belongs_to association defined called 'commenter' with Class name 'User' and foreign key 'author_id' 
  belongs_to( :commenter, class_name: "User", foreign_key: "author_id")

  # Comment#photo: returns a row from the photos table associated to this comment by the photo_id column
  #Comment has a belongs_to association defined called 'photo' with Class name 'Photo' and foreign key 'photo_id'
  belongs_to( :photo, class_name: "Photo", foreign_key: "photo_id")

  

  #def commenter
  #  my_author_id = self.author_id

  #  matching_users = User.where({ :id => my_author_id })

  #  the_user = matching_users.at(0)

  #  return the_user
  #end


end
