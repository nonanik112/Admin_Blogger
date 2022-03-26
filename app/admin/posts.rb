ActiveAdmin.register Post do
	permit_params :title, :body, :image, :published_at, :author_id, category_ids: []
	includes :author


  form partial: 'form'
		scope :all
		scope :published
	  scope :unpublished

		filter :title
    filter :author_name, as: :string
    filter :created_at
    filter :categories



  index do |c|
  selectable_column
	column :id
	column :title
	column :published?
	
	column :author
	column :created_at
	column "Image" do |product|
	  image_tag(product.image,width:40,height:30)
	end
	c.actions
 end




  show do |t|
	     attributes_table do
			  row :title
        row :body
        row :author
        row :created_at
        row :updated_at
        row :categories
			  row :published_at
			  row :unpublished

				row :image do |ad|
				  image_tag url_for(ad.image)
				end
			end
		end


    form :html => { :enctype => "multipart/form-data" } do |f|
    			f.inputs  do
    				f.inputs :title, :body, :author
						f.inputs "Categories" do
            f.input :categories, as: :check_boxes
    				f.input :image, as: :file
    			end
         end
    			f.actions
    		 end


         		action_item :publish, only: :show do
         				   link_to "Publish", publish_admin_post_path(post), method: :put if !post.published_at?
         			end

         			action_item :publish, only: :show do
         	         link_to "Unublish", unublish_admin_post_path(post), method: :put if post.published_at?
         	   end

         	   member_action :publish, method: :put do
         	       post = Post.find(params[:id])
         	       post.update(published_at: Time.zone.now)
         	       redirect_to admin_post_path(post)
         	   end

         	   member_action :unublish, method: :put do
         	       post = Post.find(params[:id])
         	       post.update(published_at: nil)
         	       redirect_to admin_post_path(post)
         	    end
end

















# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# Uncomment all parameters which should be permitted for assignment
#
# permit_params :title, :text
#
# or
#
# permit_params do
#   permitted = [:title, :text]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
