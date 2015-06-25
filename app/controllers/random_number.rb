class RandomNumber
  
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, response = @app.call(env)
    [status, headers, response << rand(100)]   
  end
end