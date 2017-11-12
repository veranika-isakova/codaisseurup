class ChangeDataTypeForRegistrationStatus < ActiveRecord::Migration[5.1]
  def change
    change_column(:registrations, :status, 'boolean using status::boolean')
  end
end
