class Child < ApplicationRecord
	
	scope :i_am_bored, -> { where(bored: true) }
  scope :first_names, -> {order(first_name: :asc)}

	belongs_to :family
	has_many :participants  
  has_many :playdates, through: :participants

  validates_presence_of :age
  validates_presence_of :first_name
  validates_presence_of :last_name

  def playdate_today
		self.playdates.where(datetime: Date.today.beginning_of_day..Date.today.end_of_day).order(datetime: :asc)
  end 

  def upcoming_playdates
    self.playdates.where("datetime > ?", Date.today.end_of_day).order(datetime: :asc)
  end

  def child_age 
    (Time.zone.now - self.age.to_time).div(1.year.seconds)
  end
  
end
