require 'csv'

class Applicant < ActiveRecord::Base
  CSV_FIELDS = [:id, :name, :email, :created_at]

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

  def to_a(question_ids=[])
    ansdata = answers.select { |ans| question_ids.include?(ans.question.id) }.map(&:body)
    attributes.values_at(*CSV_FIELDS.map(&:to_s)) + ansdata
  end

  def self.to_csv
    questions = Question.all # current questions
    CSV.generate do |csv|
      csv << CSV_FIELDS + questions.map(&:name)
      self.order(:position).each do |applicant|
        csv << applicant.to_a(questions.map(&:id))
      end
    end
  end
end
