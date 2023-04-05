class LineItemsController < ApplicationController
  before_action :set_quote
  before_action :set_line_item_date
  before_action :set_line_item, only: [:edit, :update, :destroy]

  # GET /line_items or /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1 or /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = @line_item_date.line_items.build
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items or /line_items.json
  def create
    @line_item = @line_item_date.line_items.build(line_item_params)

    if @line_item.save
      respond_to do |format|
        format.html { redirect_to quote_path(@quote), notice: "Item was successfully created." }
        format.turbo_stream { flash.now[:notice] = "La ligne a bien ete crée ." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /line_items/1 or /line_items/1.json
  def update
    if @line_item.update(line_item_params)
      respond_to do |format|
        format.html { redirect_to quote_path(@quote), notice: "Item was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "La ligne a bien ete modifier ." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /line_items/1 or /line_items/1.json
  def destroy
    @line_item.destroy

    respond_to do |format|
      format.html { redirect_to quote_path(@quote), notice: "Date was successfully destroyed." }
      format.turbo_stream { flash.now[:notice] = "La ligne a bien ete supprimer ." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  
    def set_line_item
    @line_item = @line_item_date.line_items.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
    def line_item_params
      params.require(:line_item).permit(:name, :line_item_date_id, :description, :quantity, :unit_price)
    end

    def set_quote
      @quote = current_compagny.quotes.find(params[:quote_id])
    end

    def set_line_item_date
      @line_item_date = @quote.line_item_dates.find(params[:line_item_date_id])
    end
end
