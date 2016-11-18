class ToolsController < ApplicationController
  before_action :set_tool, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  def index
    @tools = Tool.all
    respond_with(@tools)
  end

  def show
    respond_with(@tool)
  end

  def new
    @tool = Tool.new
    respond_with(@tool)
  end

  def edit
  end

  def create
    @tool = Tool.new(tool_params)
    @tool.save
    respond_with(@tool)
  end

  def update
    @tool.update(tool_params)
    respond_with(@tool)
  end

  def destroy
    @tool.destroy
    respond_with(@tool)
  end

  private
    def set_tool
      @tool = Tool.find(params[:id])
    end

    def tool_params
      params.require(:tool).permit(:file_name, :enabled)
    end
end
