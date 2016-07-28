class Response < ActiveRecord::Base

  validates :user_id, :answer_id, presence: true
  validate  :no_poll_author, :not_duplicate_response

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_id,
    class_name: :AnswerChoice

  has_one :question,
    through: :answer_choice,
    source: :question


  def not_duplicate_response
    if respondent_already_answered?
      errors[:duplicate] << 'answer from same user'
    end
  end

  def sibling_responses
    #TODO
    # question.answer_choices.first.responses
    question.responses.where.not(id: self.id)
  end

  def respondent_already_answered?
    sibling_responses.exists?(user_id: self.user_id)
  end

  def no_poll_author
    if question.poll.author_id == self.user_id
      errors[:author] << "can't respond"
    end
  end


end
