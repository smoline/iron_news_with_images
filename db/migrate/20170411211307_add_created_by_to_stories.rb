class AddCreatedByToStories < ActiveRecord::Migration[5.0]
  def change
    add_column :stories, :created_by_id, :integer
  end
end
