class Question < ActiveRecord::Base

  validates :poll_id, presence: true

  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: :Poll

  has_many :answer_choices,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :AnswerChoice

  has_many :responses,
    through: :answer_choices,
    source: :responses

  def results
    result = Hash.new(0)
    # answer_choices.each do |ac|
    #   result[ac.text] = ac.responses.count
    # end
    # result

    # answer_choices_data = answer_choices.includes(:responses)
    # answer_choices_data.each do |ac|
    #   result[ac.text] = ac.responses.length
    #
    # end
    ac_data = self
      .answer_choices
      .select("answer_choices.*, COUNT(*) as response_count")
      .joins("LEFT OUTER JOIN responses ON answer_choices.id = responses.answer_id")
      .group("answer_choices.id")

    ac_data.each { |el| result[el.text] = el.response_count }
    result

  end
end
