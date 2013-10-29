class User < ActiveRecord::Base
  attr_accessible :email, :DOB, :emp_id, :first_name, :gender, :hobbies, :interest, :last_name, :location, :project_id, :project_name
 validates :first_name, presence: true, length: { maximum: 20 }, :format => { :with => /^[A-Za-z]+$/ } 
validates :last_name, presence: true, length: { maximum: 20 },:format => { :with => /^[A-Za-z]+$/ }
validates :gender, presence: true

validates :interest, presence: true, length: { maximum: 40 }
validates :DOB, presence: true
validates :location, presence: true, length: { maximum: 40 },:format => { :with => /^[A-Za-z]+$/ }
validates :emp_id, presence: true, length: { maximum: 6 }


has_many :projects
belongs_to :member


end
