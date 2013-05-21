class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.belongs_to  :user
      t.string      :name
      t.string      :state
      t.datetime    :expired_at
      t.string      :slug

      t.timestamps
    end

    add_index :surveys, :user_id
    add_index :surveys, :expired_at
    add_index :surveys, :slug, :unique => true
  end
end
