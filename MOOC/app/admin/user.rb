ActiveAdmin.register User do 
    permit_params  :email, :username , :pic , :dob

    index do
        selectable_column
        id_column
        column :email
        column :pic do |user|
            image_tag(user.pic.thumb)
        end
        column :created_at
        actions
    end

    show do |user|
        attributes_table do 
            row :email
            row :username
            row :pic do
                image_tag(user.pic.thumb)
            end
            row :dob
            row :created_at
            row :updated_at
        end
    end
end 