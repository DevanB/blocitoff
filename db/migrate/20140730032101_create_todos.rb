class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.references :user, index: true
      t.string :description
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
