class Admin::ProdutosController < ApplicationController
  before_filter :authenticate_user!

  respond_to :html
  def index
    @produtos = Produto.all
  end

  # GET /produtos/1
  # GET /produtos/1.json
  def show
    @produto = Produto.find(params[:id])
    respond_with @produto
  end
  def new
    @produto = Produto.new
    respond_with @produto
  end
  def edit
    @produto = Produto.find(params[:id])
  end

  def create
    @produto = Produto.new(params[:produto])
    flash[:notice] = 'Produto was successfully created.' if @produto.save
    respond_with @produto, :location => admin_produto_path(@produto)
  end
  def update
    @produto = Produto.find(params[:id])
    flash[:notice] = 'Produto was successfully updated.' if @produto.update_attributes(params[:produto])
    respond_with @produto, :location => admin_produto_path(@produto)
  end

  # DELETE /produtos/1
  # DELETE /produtos/1.json
  def destroy
    @produto = Produto.find(params[:id])
    @produto.destroy
    
    respond_with @produtos, :location => admin_produtos_path
  end
end
