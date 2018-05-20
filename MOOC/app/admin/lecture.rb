ActiveAdmin.register Lecture do 
    permit_params  :content, :attachment , :created_at , :updated_at

    # index do
    #     selectable_column
    #     id_column
    #     column :content
    #     column :attachment
    #     column :created_at
    #     column :updated_at
    #     actions
    # end

    form do |f|
        f.input :course_id, as: :select, multiple: false, collection: Lecture.all.map{|u| [u.title]}
    end
end 