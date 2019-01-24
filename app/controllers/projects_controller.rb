class ProjectsController < ApplicationController
  
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new

  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    project =Project.find(params[:id])
    project.update!(project_params)
    redirect_to projects_url, notice: "プロジェクト「#{project.name}」を更新しました。"
  end

  def destroy
    project = Project.find(params[:id])
    project.destroy
    redirect_to projects_url, notice: "タスク「#{project.name}」を削除しました。"
  end
  def create
    project = Project.new(project_params)
    project.save!
    redirect_to projects_url, notice: "プロジェクト「#{project.name}」を登録しました！！"
  end


  private
  def project_params
    params.require(:project).permit(
      :name,
      tasks_attributes: [:name] # 追記
    )
  end
end
