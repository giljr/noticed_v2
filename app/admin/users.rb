ActiveAdmin.register User do
  permit_params :name, :email # Ensure name and email are permitted parameters

  filter :name_cont, label: 'Name' # Add a filter for the name attribute
  filter :email_cont, label: 'Email' # Add a filter for the email attribute

  index do
    selectable_column
    id_column
    column :name
    column :email
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
    end
    f.actions
  end
end
