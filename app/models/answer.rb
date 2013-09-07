class Answer < ActiveRecord::Base
  self.table_name = 'applicant_answers'

  acts_as_indexed :fields => [:body]
  attr_accessible :body, :applicant_id, :applicant_question_id, :question

  belongs_to :applicant
  belongs_to :question, :foreign_key => :applicant_question_id

  delegate :answer_type, :character_limit, :character_limit?, :answer_required?, :to => :question, :allow_nil => true

  # validates :applicant, :presence => true
  # validates :question, :presence => true
  validates :body, :presence => true, :if => :answer_required?
  validate :validate_body_length

  private

  def validate_body_length
    if character_limit? && body.length > character_limit
      self.errors.add(:body, "must be less than #{character_limit} characters")
    end
  end
end
