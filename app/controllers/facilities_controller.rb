class FacilitiesController < ApplicationController
  before_action :set_facility, only: [:show, :edit, :update, :destroy]

  respond_to :html, :js

  def update_company_select
    @contacts = Contact.where(:company_id => params[:company])
  end

  def update_contact_select

  end

  def index
    #@facilities = Facility.all

    @facilities = parse_order_by(params[:order_by])


 #   session[:order_facilities_by] = params[:order_by] if params[:order_by]
 #   order_by = session[:order_facilities_by]
 #
 #
 #
 #   if session[:order_facilities_desc] == true
 #     @facilities = Facility.includes(:address).includes(:contact).includes(:company).order(order_by).reverse
 #     session[:order_facilities_desc] = false
 #   else
 #     @facilities = Facility.includes(:address).includes(:contact).includes(:company).order(order_by)
 #     session[:order_facilities_desc] = true
 #   end


    respond_with(@facilities)
  end

  def show
    respond_with(@facility)
  end

  def new
    @facility = Facility.new
    respond_with(@facility)
  end

  def edit
  end

  def create
    @facility = Facility.new(facility_params)
    @facility.save
    respond_with(@facility)
  end

  def update
    @facility.update(facility_params)
    respond_with(@facility)
  end

  def destroy
    @facility.destroy
    respond_with(@facility)
  end

  private
    def set_facility
      @facility = Facility.find(params[:id])
    end

    def facility_params
      params.require(:facility).permit(:name, :contact_id, :company_id, :setting)
    end

    def parse_order_by(order_by)
      ordered_records = sanatize_and_parse_order_by(order_by)

      ordered_records
    end

    def sanatize_and_parse_order_by(order_by)
      #sanatize parameter
      order = %w|contact company city state setting name|.include?(order_by) ? order_by : nil
      #check to see if value sent as URL param == value saved in session to determine direction
      if order
        @desc =(not session[:order_facilities_desc]) if order == session[:order_facilities_by]
      else
        @desc = nil
      end
      #if order is nil, use what is saved on the session
      order = order || session[:order_facilities_by]
      #parse
      case order
        when 'contact'
          records = Facility.includes(:contact).order('contacts.name')
        when 'company'
          records = Facility.includes(:company).order('companies.name')
        when 'city'
          records = Facility.includes(:address).order('addresses.city')
        when 'state'
          records = Facility.includes(:address).order('addresses.state').order('addresses.city')
        when 'name'
          records = Facility.order('name')
        when 'setting'
          records = Facility.order('setting')
        else
          records = Facility.all
      end

      session[:order_facilities_by] = order_by
      session[:order_facilities_desc] = @desc

      @desc ? records.reverse : records
    end


    def set_order_by_session(order_by, desc)

    end
end
