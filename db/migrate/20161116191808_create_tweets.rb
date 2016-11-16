class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.text :content
      t.belongs_to :bird

      t.timestamps
    end
  end
end
