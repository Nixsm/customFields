class CustomFieldsController < ApplicationController
  def show
    @user = User.find(params[:user_id])

    # render plain: @user.inspect
  end
  def new
    @user = User.find(params[:user_id])
    @type = params[:format]

  end

  def create
    @user = User.find(params[:user_id])

    # check if the user has any custom field
    @user.custom_fields ||= {}

    local_params = params[:custom_field]
    field_type = local_params[:field_type]
    if field_type.eql? 'text_field' or field_type.eql? 'text_area'
      field_name = params[:custom_field][:input_label]
      @user.custom_fields[field_name] = field_type
      if @user.save
        redirect_to @user
      end
    end

  end
end
