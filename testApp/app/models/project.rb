class Project < ActiveRecord::Base
  attr_accessible :end_date, :location, :name, :start_date, :user_id
	validates :name, presence: true, length: { maximum: 20 }, :format => { :with => /^[A-Za-z]+$/ } 
        validates :location, presence: true, length: { maximum: 20 }, :format => { :with => /^[A-Za-z]+$/ } 
	validates :user_id, presence: true, length: { maximum: 20 }, :format => { :with => /^[-0-9]+$/ } 
belongs_to :user
	


end
