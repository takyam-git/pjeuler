class ScriptsController < ApplicationController
  # GET /scripts
  # GET /scripts.json
  def index
    @dirs = Script::dirs
  end

  def dir
    @dir = params[:name]
    @scripts = Script::dir_scripts(@dir)
  end

  # GET /scripts/1
  # GET /scripts/1.json
  def show
    @script = Script.find(params[:id])
    @script.benches.order('id DESC')
  end

  def run
    script = Script.find_by_id(params[:id])
    redirect_to '/' if script.nil?

    script.run_bench

    if params[:dir].nil?
      redirect_to "/#{params[:id]}"
    else
      redirect_to "/dir/#{params[:dir]}"
    end
  end

  def refresh
    @new_scripts = Script.refresh_scripts
  end
end
