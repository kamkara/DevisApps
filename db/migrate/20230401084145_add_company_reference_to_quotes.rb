class AddCompanyReferenceToQuotes < ActiveRecord::Migration[7.0]
  def change
    add_reference :quotes, :compagny, null: false, foreign_key: true
  end
end
