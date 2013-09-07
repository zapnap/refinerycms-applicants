class Applicant < ActiveRecord::Base

  has_many :answers
  has_many :questions, :through => :answers

  acts_as_indexed :fields => [:name, :contact_name, :contact_email, :contact_phone]
  attr_accessible :name, :contact_name, :contact_email, :contact_phone, :position, :answers_attributes
  accepts_nested_attributes_for :answers

  validates :name, :presence => true, :uniqueness => true
  validates :contact_name, :presence => true
  validates :contact_email, :presence => true
  validates :contact_phone, :presence => true

  def build_answers
    Question.all.each do |q|
      answers.build(:question => q)
    end

    answers
  end
end
