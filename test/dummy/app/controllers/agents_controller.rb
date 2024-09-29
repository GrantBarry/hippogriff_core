# frozen_string_literal: true

class AgentsController < ApplicationController
  include SetAccount
  before_action :set_agent, only: %i[show edit update destroy]

  def index
    @agents = @account.agents
  end

  def show
    @agent = @account.agents.find(params[:id])
  end

  def new
    @agent = @account.agents.build
    @agents = @account.agents
  end

  def create
    @agent = @account.agents.build(agent_params)
    @agents = @account.agents

    if @agent.save
      redirect_to [@agent.account, @agent], notice: 'Agent was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @agent.update(agent_params)
      redirect_to [@agent.account, @agent], notice: 'Agent was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @agent.destroy
      redirect_to account_agents_path(@account), notice: 'Agent was successfully destroyed.'
    else
      redirect_to account_agents_path(@account), alert: 'Agent could not be destroyed.'
    end
  end

  private

  def set_agent
    @agent = @account.agents.find(params[:id])
  end

  def agent_params
    params
      .require(:agent)
      .permit(
        :first_name,
        :last_name,
        :email,
        :role,
        :password,
        :mobile,
        :fax,
        :phone,
        :time_zone
      )
  end
end
