class AddTypeToProCons < ActiveRecord::Migration[5.1]
  def change
  		add_column :pro_cons, :category, :string, default: 'pro'
  end
end
