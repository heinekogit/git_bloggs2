class ReportsController < ApplicationController
    
    # before_action :authenticate_user!
    
    def index
        @reports = Report.order('created_at DESC').page(params[:page]).per(5)
    end
    
    def new
        @report = Report.new
    end
    
    def create
        Report.create(report_params)
        redirect_to "/"
    end
    
    def edit
        @report = Report.find(params[:id])
    end
    
    def update
        report = Report.find(params[:id])
        if report.user_id == current_user.id
            report.update(report_params)
        end
        redirect_to root_path
        # redirect_to report_path
        # redirect_to "/reports/current_user.id"
        
    end
    
    def destroy
        report = Report.find(params[:id])
        if report.user_id == current_user.id
            report.destroy
        end
        redirect_to root_path
    end

    
    private
    def report_params
        params.require(:report).permit(:title, :detail).merge(user_id: current_user.id)
    end
    
end

