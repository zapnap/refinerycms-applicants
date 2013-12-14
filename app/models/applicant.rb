class Applicant < ActiveRecord::Base

  has_many :answers
  has_many :questions, :through => :answers

  acts_as_indexed :fields => [:name]
  attr_accessible :name, :email, :position, :answers_attributes
  accepts_nested_attributes_for :answers

  validates :name, :presence => true, :uniqueness => true
  validates :email, :presence => true

  def build_answers
    Question.current.all.each do |q|
      answers.build(:question => q)
    end

    answers
  end
end
