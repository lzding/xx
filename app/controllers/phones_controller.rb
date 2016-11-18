class PhonesController < ApplicationController
  before_action :set_phone, only: [:show, :edit, :update, :destroy]
  layout 'root_files'

  # GET /phones
  # GET /phones.json
  def index
    if search_params.blank?
      @phones = Phone.all.includes(:root_file).page(params[:page])
    else
      @phones = Phone.where(search_params).includes(:root_file).page(params[:page])
    end
  end

  # GET /phones/1
  # GET /phones/1.json
  def show
  end

  # GET /phones/new
  def new
    @phone = Phone.new(source_name: 'custom_add',count:0)
  end

  # GET /phones/1/edit
  def edit
  end

  # POST /phones
  # POST /phones.json
  def create
    @phone = Phone.new(phone_params)

    respond_to do |format|
      if @phone.save
        format.html { redirect_to @phone, notice: 'Phone was successfully created.' }
        format.json { render :show, status: :created, location: @phone }
      else
        format.html { render :new }
        format.json { render json: @phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phones/1
  # PATCH/PUT /phones/1.json
  def update
    respond_to do |format|
      if @phone.update(phone_params)
        format.html { redirect_to @phone, notice: 'Phone was successfully updated.' }
        format.json { render :show, status: :ok, location: @phone }
      else
        format.html { render :edit }
        format.json { render json: @phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phones/1
  # DELETE /phones/1.json
  def destroy
    @phone.destroy
    respond_to do |format|
      format.html { redirect_to phones_url, notice: 'Phone was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def search_params
      search_params = {}
      search_params.merge!(vendor: params[:vendor]) unless params[:vendor].blank?
      search_params.merge!(product_model: params[:product_model]) unless params[:product_model].blank?
      search_params.merge!(linux_version: params[:linux_version]) unless params[:linux_version].blank?
      search_params.merge!(build_date: params[:build_date]) unless params[:build_date].blank?
      search_params.merge!(root_file_id: params[:root_file_id]) unless params[:root_file_id].blank?

      search_params
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_phone
      @phone = Phone.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def phone_params
      params.require(:phone).permit(:vendor, :product_model, :linux_version, :build_date, :utc_date, :root_file, :source_name,:root_file_id)
    end

    def save_phones

      root_files = params[:phone][:root_file].reject {|x| x.blank?}

      root_files.each do |root_file_id|
        phone = Phone.new(phone_params)
        phone.root_file_id = root_file_id
        phone.save!
      end
    end
end
