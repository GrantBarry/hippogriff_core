# frozen_string_literal: true

class AccountsController < ApplicationController
  before_action :find_account, only: %i[show edit update destroy]
  def index
    @accounts = Account.all
  end

  def show; end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)

    if @account.save
      redirect_to @account
    else
      render :new
    end
  end

  def edit; end

  def update
    if @account.update(account_params)
      redirect_to @account
    else
      render :edit
    end
  end

  def destroy
    @account.destroy

    redirect_to accounts_path
  end

  private

  def account_params
    params.require(:account).permit(:company_name, :legal_name, :email, :phone, :fax)
  end

  def find_account
    @account = Account.find(params[:id])
  end
end
