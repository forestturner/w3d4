class AddTextColumn < ActiveRecord::Migration
  def change
    add_column :answer_choices, :text, :text
  end
end
