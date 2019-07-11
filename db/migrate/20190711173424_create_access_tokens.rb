class CreateAccessTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :access_tokens do |t|
      t.string :token
      t.belongs_to :expert
      t.timestamps
    end

    User.all.each do |expert|
      unless AccessToken.exists?(expert_id: expert.id)
        AccessToken.create(expert_id: expert.id)
      end
    end
  end
end
