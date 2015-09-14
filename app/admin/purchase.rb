ActiveAdmin.register Kendocup::Purchase, as: "Purchase" do

  permit_params :product_id, :kenshi_id
end
