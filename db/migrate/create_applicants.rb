class CreateApplicants < ActiveRecord::Migration

  def self.up
    create_table :applicants do |t|
      t.string :name
      t.integer :position
      t.timestamps
    end

    create_table :applicant_questions do |t|
      t.string :name
      t.boolean :answer_required
      t.string :answer_type # :text, :string, etc.
      t.integer :character_limit
      t.integer :position
      t.datetime :deleted_at
      t.timestamps
    end

    create_table :applicant_answers do |t|
      t.references :applicant
      t.references :applicant_question
      t.text :body
      t.timestamps
    end

    add_index :applicants, :id
    add_index :applicant_questions, :id
    add_index :applicant_answers, :id
    add_index :applicant_answers, :applicant_id
    add_index :applicant_answers, :applicant_question_id

    load(Rails.root.join('db', 'seeds', 'applicants.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "applicants"})

    Page.delete_all({:link_url => "/applicants"})

    drop_table :applicants
  end

end
