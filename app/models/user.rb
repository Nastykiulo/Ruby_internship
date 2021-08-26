class User < ApplicationRecord
   #before_action :authenticate_user!
   after_create :default_role 
   has_many :students
  

   enum role: [:guest, :teacher, :student, :admin]
   def admin?
      type == 'Admin'
      self.role == "admin"
   end
   def teacher?
      type == 'Teacher'
      self.role == "teacher"
   end
   def student?
      type == 'Student'
      self.role == "student"
   end

   # Serialize string instead of BSON
   def self.serialize_into_session(record)
      [record.to_key.map(&:to_s), record.authenticatable_salt]
   end

   # Serialize string instead of BSON
   def self.serialize_into_cookie(record)
      [record.to_key.map(&:to_s), record.rememberable_value]
   end
  # after_initialize :set_default_role, :if => :new_record?

  # def set_default_role
  #   self.role ||= :guest
  # end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   private
   def default_role
      self.role ||= :guest
   end
end
 