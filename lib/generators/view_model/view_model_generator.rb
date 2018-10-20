class ViewModelGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)
  
  def create_view_model_files
    template "view_model.rb", File.join("app/view_models", class_path, "#{file_name}_view.rb")
  end
end
