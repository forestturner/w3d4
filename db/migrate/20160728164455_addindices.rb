class Addindices < ActiveRecord::Migration
  def change
    add_index :questions, :poll_id
    add_index :answer_choices, :question_id
    add_index :responses, [:user_id, :answer_id]
  end
end
