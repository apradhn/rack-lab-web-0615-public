class ErbMaker
  def initialize(app)
    @app = app
  end

  def call(env)
    route = env["PATH_INFO"]
    status, headers, response = @app.call(env)
    
    if route == "/about"
      html = File.read("./lib/templates/about.html.erb")
      template = ERB.new(html)
      result = template.result(binding)  
      response = result
    elsif route == "/"
      html = File.read("./lib/templates/index.html.erb")
      template = ERB.new(html)
      result = template.result(binding)   
      response << result
    end
      [status, headers, response]         
  end
end