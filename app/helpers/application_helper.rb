module ApplicationHelper
  include HtmlTools
  include ErrorsHelper

  def dynamic_select(collection, select_on_method, select_that_triggers, select_that_changes, name_method: :name, id_method: :id, include_blank: true)
    render :partial => 'tools/dynamic_select', :locals => {:collection => collection, :select_on_method => select_on_method,
                                                           :select_that_triggers => select_that_triggers, :select_that_changes => select_that_changes,
                                                           :name_method => name_method, :id_method => id_method, :include_blank => include_blank}
  end

  def update_select_from_modal(object, select_id, modal_id = 'express_modal', name_method = :name, id_method = :id)
    render :partial => 'tools/update_from_modal', :locals => {:object => object, :modal_id => modal_id, :select_id => select_id,
                                                             :name_method => name_method, :id_method => id_method}
  end

  def new_modal(object, modal_id = 'express_modal')
    render :partial => 'tools/new_modal', :locals => {:object => object, :modal_id => modal_id}
  end
end


