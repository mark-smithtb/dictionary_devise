class ExamplesController < ApplicationController
  before_filter :ensure_logged_in
  before_action :set_example, only: [:show, :edit, :update, :destroy]
  def show
  end

  def new
    @definition_id = params['definition']
    @example = Example.new
  end

  def create
      @example = Example.new(example_params)

      respond_to do |format|
        if @example.save
          format.html { redirect_to definition_path(id: @example.definition_id), notice: 'Example was successfully created.' }
          format.json { render json: :index, status: :created }
        else
          format.html { render :new }
          format.json { render json: @example.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @example.destroy
      respond_to do |format|
        format.html { redirect_to :back, notice: 'Example was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_example
      @example = Example.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def example_params
      params.require(:example).permit(:example, :definition_id)
    end
end
