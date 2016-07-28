class User < ActiveRecord::Base
  validates :user_name, presence: true, uniqueness: true

  has_many :responses

  has_many :polls,
   primary_key: :id,
   foreign_key: :author_id,
   class_name: :Poll

  has_many :questions,
    through: :polls,
    source: :questions

def completed_polls

  sub_query = AnswerChoice
  .select("answer_choices.question_id as id, count(responses.*) as r_c")
  .joins("left outer join responses on responses.answer_id = answer_choices.id")
  .where("responses.user_id = ?", id)
  .group("answer_choices.id")

  Polls
  .joins("questions on questions.poll_id = polls.id")
  .joins("left outer join (#{sub_query.to_sql}) as rc on rc.id = questions.id")
  .group("polls.id")
  .having("coun(questions.*) = count(rc)").to_a
end
#
# (<<-SQL)
#
#
# select
#   polls.id
# from
#   polls
# join
#   questions on questions.poll_id = polls.id
# LEFT OUTER JOIN
#   (select
#     answer_choices.question_id as id, count(responses.*) as r_count
#   from
#     answer_choices
#   left join
#     responses on responses.answer_id = answer_choices.id
#   where
#     responses.user_id = 2
#   group by
#     answer_choices.id) AS RC ON RC.id = questions.id
# group by
#   polls.id
# having
#   count(questions.*) = count(rc)
