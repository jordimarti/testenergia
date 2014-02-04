class DeviseCreateExperts < ActiveRecord::Migration
  def change
    create_table(:experts) do |t|
      ## Database authenticatable
      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, :default => 0, :null => false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, :default => 0, :null => false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      ## Expert info
      t.string :expert_first_name
      t.string :expert_surname1
      t.string :expert_surname2
      t.string :expert_id_document_type
      t.string :expert_id_document_number
      t.string :expert_telephone
      t.string :expert_mobile_phone
      t.string :expert_road_type
      t.string :expert_road_name
      t.string :expert_address_number
      t.string :expert_block
      t.string :expert_stairs
      t.string :expert_story
      t.string :expert_door
      t.string :expert_zip_code
      t.string :expert_town
      t.string :expert_province
      t.string :title
      t.string :referee_number

      t.timestamps
    end

    add_index :experts, :email,                :unique => true
    add_index :experts, :reset_password_token, :unique => true
    # add_index :experts, :confirmation_token,   :unique => true
    # add_index :experts, :unlock_token,         :unique => true
  end
end
