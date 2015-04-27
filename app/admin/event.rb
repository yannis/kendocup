ActiveAdmin.register Kendocup::Event, as: "Event" do

  permit_params :cup, :name_en, :name_fr, :start_on, :duration

  index do
    column :cup
    column :name_en
    column :name_fr
    column :start_on
    column :duration
    actions
  end

  filter :name_fr
  filter :cup

  form do |f|
    f.inputs "Details" do
      f.input :cup
      f.input :name_en
      f.input :name_fr
      f.input :start_on, as: :string, input_html: {class: "hasDatetimePicker"}
      f.input :duration
    end
    f.actions
  end

end
