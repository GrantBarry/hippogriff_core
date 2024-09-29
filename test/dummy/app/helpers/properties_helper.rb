module PropertiesHelper
  def select_type(form)
    types = %w[Property::Industrial Property::Commercial Property::Retail Property::Residential]
    form.select :type, types.map { |type|
                         [type.titleize, type]
                       }, { include_blank: true }, class: 'form-control'
  end

  def select_agents(form)
    form.collection_select :agent_id, form.object.account.agents, :id, :name, prompt: 'Select an Agent'
  end

  def form_url(property)
    property.new_record? ? account_properties_path(property.account) : account_property_path(property.account, property)
  end
end
