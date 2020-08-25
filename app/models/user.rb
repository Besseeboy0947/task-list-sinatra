class User < ActiveRecord::Base
	has_many :tasks
	has_secure_password
end
 #Models are responsible for extablishing a realationship & association between the two objects 