class CustomFieldsController < ApplicationController
  def show
    @user = User.find(params[:user_id])
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

    # check if the field is either a text_field or text_area
    if field_type.eql? 'text_field' or field_type.eql? 'text_area'
      # fetch the field name
      field_name = params[:custom_field][:input_label]
      # and use it to save a new field to the user
      @user.custom_fields[field_name] = field_type
      # sawe the user
      if @user.save
        # and redirect to the user screen
        redirect_to @user
      end
    end

    # if we have a combo box custom field
    if field_type.eql? 'combo_box'
      # fetch the field name
      field_name = params[:custom_field][:input_label]
      # split by \r\n separator which is a new line in the text_area
      input = local_params[:input].split /[\r\n]+/

      # add a the field to the user
      @user.custom_fields[field_name] = input

      # sawe the user
      if @user.save
        # and redirect to the user screen
        redirect_to @user
      end
    end

  end
end
