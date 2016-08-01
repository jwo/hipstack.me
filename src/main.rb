require 'opal'
require 'clearwater'

class Hipstack
  include Clearwater::Component

  FRONT_ENDS = ["React", "Angular 2", "Ember", "Mithril", "Elm", "VueJS", "Clearwater"]
  MODS = ["Server-Less Architecture", "ImmutableJS", "ES2016 Classes", "Redux", "FalcorJS", "Isomorphic Code", "GrandCentral"]
  BUILD_TOOLS = ["Gulp", "Grunt", "Ember-CLI", "Yeoman", "Webpack", "bespoke build pipeline", "Rails Asset Pipeline"]
  MOBILE = ["Xamarin", "Ionic", "Titanium", "React-Native", "Pure Android", "Native iOS"]
  APIS = ["HAPI", "NodeJS", "Rails-API", "Elixir/Phoenix", "GO", "PHP"]
  DEPLOY_TOOLS = ["Terraform", "Capistrano", "Mina", "Chef", "Puppet", "Ansible"]
  DEPLOY_ENVS = ["Heroku", "Amazon S3", "Amazon Lambda", "Digital Ocean", "GitHub Pages", "Surge"]

  def render
    div({ class_name: 'container' }, [
      div({ class_name: 'stack-selection' }, [
        div({ class_name: stack_class_name }, stack),
        button({ onclick: method(:reset_stack) }, selection_button_text),
      ]),
      div({ class_name: 'love' }, [
        "This app is built with love by ",
        a({ href: "https://twitter.com/jwo" }, "JWo"),
        " from Sugar Land, TX with Elm and Webpack, deployed to GitHub Pages  ",
        a({ href: "https://github.com/jwo/hipstack.me" }, "GitHub"),
      ]),
    ])
  end

  def reset_stack
    set_stack
    call # Re-render after updating state
  end

  def set_stack
    @front_end   = FRONT_ENDS.sample
    @mods        = MODS.sample(2)
    @build_tool  = BUILD_TOOLS.sample
    @mobile      = MOBILE.sample
    @api         = APIS.sample
    @deploy_tool = DEPLOY_TOOLS.sample
    @deploy_env  = DEPLOY_ENVS.sample
    @stacked     = true # Stack has been set
  end

  def stack
    if stacked?
      "You should build a #@front_end application with #{@mods.join(' and ')}. " \
        "Your build pipeline should be #@build_tool. Obvs we'll build a mobile " \
        "app with #@mobile served by a #@api. And we'll totes deploy with " \
        "#@deploy_tool to #@deploy_env. (unless something else is new hotness " \
        "by now)."
    end
  end

  def stack_class_name
    'the-stack' if stacked?
  end

  def selection_button_text
    if stacked?
      'Select You (another) Hipstack!'
    else
      'Select You a HipStack!'
    end
  end

  def stacked?
    @stacked
  end
end

app = Clearwater::Application.new(
  component: Hipstack.new,
  element: Bowser.document['#main'],
)
app.call
