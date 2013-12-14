class Update1AddEmailToApplicants < ActiveRecord::Migration
  def self.up
    add_column :applicants, :email, :string
    RefinerySetting.find_or_set(:applicant_recipients, [])
  end

  def self.down
    remove_column :applicants, :email
  end
end
