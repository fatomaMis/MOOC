ActiveAdmin.register Course do 
    index do
        selectable_column
        id_column
        column :title
        column :created_at
        actions
      end

    form do |f|
        f.input :user_id, as: :select, multiple: false, collection: User.all.map{|u| [u.email, u.id]}
    end
    

    
end