module Admin
  class GroupsController < BaseController
    load_and_authorize_resource
    before_filter :set_title
    caches_action :index, { :layout => false }
    after_filter :destroy_cache, :only=>[:update, :destroy, :create]

    def index
      @groups = Group.where(:parent_id=>nil).order("position").paginate(:page=>params[:page])
    end

    def new
      if params[:parent_id]
        @parent = Group.find(params[:parent_id])
      end
      @group = Group.new
    end

    def create
      @group = Group.new(params[:group])
      if params[:parent_id]
        @group.parent_id = params[:parent_id] 
      end

      if @group.save
        redirect_to(admin_groups_path, :notice => t("created")) 
      else
        render :action => "new" 
      end
    end

    def edit
      #render edit template
    end

    def update
      if @group.update_attributes(params[:group])
        redirect_to(admin_groups_path, :notice => t("updated")) 
      else
        render :action => "edit" 
      end
    end

    def destroy
      if @group.destroy
        redirect_to(admin_groups_path, :notice => t("destroyed")) 
      else
        flashe[:error]= t("some_error")
      end
    end
    
    private

    def set_title
      view_title("group")
    end
    
    
    def destroy_cache
      expire_action(:action=>:index)      
    end
  end
end
