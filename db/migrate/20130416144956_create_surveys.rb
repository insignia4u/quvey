class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.belongs_to   :user
      t.string      :name
      t.string      :state
      t.string      :expired_at
      t.string      :slug

      t.timestamps
    end
  end
end
