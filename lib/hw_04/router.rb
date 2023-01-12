module Resource
  def connection(routes)
    if routes.nil?
      puts "No route matches for #{self}"
      return
    end

    loop do
      print 'Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit: '
      verb = $stdin.gets.encode('UTF-8').chomp
      break if verb == 'q'

      action = nil

      if verb == 'GET'
        print 'Choose action (index/show) / q to exit: '
        action = $stdin.gets.encode('UTF-8').chomp
        break if action == 'q'
      end

      action.nil? ? routes[verb].call : routes[verb][action].call
    end
  end
end

class PostsController
  extend Resource

  def initialize
    @posts = []
  end

  def index
    @posts.each_with_index { |post, index| puts "#{index}. #{post}" }
  end

  def show
    print 'Enter id of post you want to get: '
    id = $stdin.gets.encode('UTF-8').chomp.to_i

    puts @posts[id]
  end

  def create
    puts 'Enter post you want to add ("end" to stop typing):'
    post = ''

    loop do
      line = $stdin.gets.encode('UTF-8')

      break if line == "end\n"

      post << line
    end

    @posts << post.chomp
  end

  def update
    print 'Enter id of post you want to update ("end" to stop typing): '
    id = $stdin.gets.encode('UTF-8').chomp.to_i

    puts 'Enter new post:'
    new_post = ''

    loop do
      line = $stdin.gets.encode('UTF-8').

      break if line == "end\n"

      new_post << line
    end

    @posts[id] = new_post.chomp
  end

  def destroy
    print 'Enter id of post you want to delete: '
    id = $stdin.gets.encode('UTF-8').chomp.to_i
    @posts.delete(@posts[id])
  end
end

class Router
  def initialize
    @routes = {}
  end

  def init
    resources(PostsController, 'posts')

    loop do
      print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
      choise = $stdin.gets.encode('UTF-8').chomp

      PostsController.connection(@routes['posts']) if choise == '1'
      break if choise == 'q'
    end

    puts 'Goodbye!'
  end

  def resources(klass, keyword)
    controller = klass.new
    @routes[keyword] = {
      'GET' => {
        'index' => controller.method(:index),
        'show' => controller.method(:show)
      },
      'POST' => controller.method(:create),
      'PUT' => controller.method(:update),
      'DELETE' => controller.method(:destroy)
    }
  end
end

router = Router.new

router.init
