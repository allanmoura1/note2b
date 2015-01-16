#Em desenvolvimento
class BillsController < ApplicationController
  before_action :set_bill, only: [:show, :edit, :update, :destroy]
  before_action :can_change, only: [:edit, :update]
  before_action :require_authentication

  # GET /bills
  # GET /bills.json
  def index
    if params[:search].present?
      @bills = Bill.search(params[:search])
        unless @bills.present?
          flash[:notice] = "Ai dentro diego"
        end
    end
  end

  # GET /bills/1
  # GET /bills/1.json
  def show
  end

  # GET /bills/new
  def new
    @bill = Bill.new
  end

  # GET /bills/1/edit
  def edit
  end

  # POST /bills
  # POST /bills.json
  def create
    @bill = Bill.new(bill_params)
    if @bill.save
      redirect_to @bill, 
      notice: 'Documento salvo com sucesso!'
    else
      render action: :new
    end
  end

  # PATCH/PUT /bills/1
  # PATCH/PUT /bills/1.json
  def update
    respond_to do |format|
      if @bill.update(bill_params)
        format.html { redirect_to @bill, notice: 'Bill was successfully updated.' }
        format.json { render :show, status: :ok, location: @bill }
      else
        format.html { render :edit }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bills/1
  # DELETE /bills/1.json
  def destroy
    @bill.destroy
    respond_to do |format|
      format.html { redirect_to bills_url, notice: 'Bill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill
      @bill = Bill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bill_params
      params.require(:bill).permit(:numero_documento, :id_upload, :notes)
    end
end
