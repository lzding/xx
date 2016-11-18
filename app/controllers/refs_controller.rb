class RefsController < ApplicationController
  before_action :set_ref, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json


  def index
    @refs = Ref.all
    respond_with(@refs)
  end

  def show
    redirect_to refs_path
  end

  def new
    @ref = Ref.new
    respond_with(@ref)
  end

  def edit
  end

  def create
    @ref = Ref.new(ref_params)
    @ref.save
    respond_with(@ref)
  end

  def update
    @ref.update(ref_params)
    respond_with(@ref)
  end

  def destroy
    @ref.destroy
    respond_with(@ref)
  end

  private
    def set_ref
      @ref = Ref.find(params[:id])
    end

    def ref_params
      params.require(:ref).permit(:version, :channel, :exec_file)
    end
end
