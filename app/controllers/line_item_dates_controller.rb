class LineItemDatesController < ApplicationController
  before_action :set_quote
  before_action :set_line_item_date, only:  %i[ edit update destroy ]


  # GET /line_item_dates or /line_item_dates.json
  def index
    @line_item_date = @quote.line_item_dates.build
  end

  # GET /line_item_dates/1 or /line_item_dates/1.json
  def show
  end

  # GET /line_item_dates/new
  def new
    @line_item_date = @quote.line_item_dates.build
  end

  # GET /line_item_dates/1/edit
  def edit
  end

  # POST /line_item_dates or /line_item_dates.json
  def create
    @line_item_date = @quote.line_item_dates.build(line_item_date_params)

    if @line_item_date.save
      respond_to do |format|
        format.html { redirect_to quote_path(@quote), notice: "Date was successfully created." }
        format.turbo_stream { flash.now[:notice] = "Date was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /line_item_dates/1 or /line_item_dates/1.json
  def update
    if @line_item_date.update(line_item_date_params)
      respond_to do |format|
        format.html { redirect_to quote_path(@quote), notice: "Date was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Date was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end
  # DELETE /line_item_dates/1 or /line_item_dates/1.json
  def destroy
    @line_item_date.destroy

    respond_to do |format|
      format.html { redirect_to quote_path(@quote), notice: "Date was successfully destroyed." }
      format.turbo_stream { flash.now[:notice] = "Date was successfully destroyed." }
    end
  end

  private

  
    # Use callbacks to share common setup or constraints between actions.
    
    def set_line_item_date
      @line_item_date = @quote.line_item_dates.find(params[:id])
    end
    

    # Only allow a list of trusted parameters through.
    def line_item_date_params
      params.require(:line_item_date).permit( :date)
    end
    
    def set_quote
      @quote = current_compagny.quotes.find(params[:quote_id])
    end
    
end
