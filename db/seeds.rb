# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


u1 = User.create!(user_name: 'user1')
u2 = User.create!(user_name: 'user2')
u3 = User.create!(user_name: 'user3')
u4 = User.create!(user_name: 'user4')
u5 = User.create!(user_name: 'user5')

p1 = Poll.create!(author_id: 1, title: 'poll1')
p2 = Poll.create!(author_id: 2, title: 'poll2')
p3 = Poll.create!(author_id: 3, title: 'poll3')
p4 = Poll.create!(author_id: 4, title: 'poll4')
p5 = Poll.create!(author_id: 5, title: 'poll5')

q1 = Question.create!(poll_id: 1, text: 'question1')
q2 = Question.create!(poll_id: 2, text: 'question2')
q3 = Question.create!(poll_id: 3, text: 'question3')
q4 = Question.create!(poll_id: 4, text: 'question4')
q5 = Question.create!(poll_id: 5, text: 'question5')

a1 = AnswerChoice.create!(question_id: 1, text: 'a')
a2 = AnswerChoice.create!(question_id: 1, text: 'b')
a3 = AnswerChoice.create!(question_id: 1, text: 'c')
a4 = AnswerChoice.create!(question_id: 2, text: 'a')
a5 = AnswerChoice.create!(question_id: 3, text: 'a')
a6 = AnswerChoice.create!(question_id: 4, text: 'a')
a7 = AnswerChoice.create!(question_id: 5, text: 'a')

r1 = Response.create!(user_id: 1, answer_id: 1)
r1 = Response.create!(user_id: 1, answer_id: 6)
r1 = Response.create!(user_id: 2, answer_id: 3)
r1 = Response.create!(user_id: 3, answer_id: 4)
r1 = Response.create!(user_id: 4, answer_id: 2)
r1 = Response.create!(user_id: 5, answer_id: 5)
