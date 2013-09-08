class Question < ActiveRecord::Base
  ANSWER_TYPES = ['string', 'text']

  self.table_name = 'applicant_questions'

  acts_as_indexed :fields => [:name]
  attr_accessible :name, :character_limit, :answer_type, :answer_required, :position

  has_many :answers, :foreign_key => :applicant_question_id
  has_many :applicants, :through => :answers

  scope :current, where('deleted_at IS NULL')

  validates :name, :presence => true, :uniqueness => true
  validates :answer_type, :presence => true, :inclusion => ANSWER_TYPES

  before_create :set_defaults

  def character_limit?
    character_limit && character_limit > 0
  end

  # override for 'safe delete'
  def destroy
    update_attribute(:deleted_at, Time.now)
  end

  private

  def set_defaults
    self.answer_type = 'text' if self.answer_type.blank?
    self.answer_required = false if self.answer_required.blank?
    self.character_limit = 0 if self.character_limit.blank?
    true
  end
end
