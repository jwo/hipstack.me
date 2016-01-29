import _ from 'underscore';

export function selectStack(){
  const stackText = `You should build a ${_.sample(frontEnds)} application with ${_.sample(modifiers, 2).join(" and ")}.  Your build pipeline should be ${_.sample(buildTool)}.
    Obvs we'll build a mobile app with ${_.sample(mobile)} served by a ${_.sample(api)} API. And we'll totes deploy to ${_.sample(deployedTo)}.
  `

  return {
    type: 'RECEIVE_NEW_STACK',
    stack: stackText
  };
}


const frontEnds = ["React", "Angular 2", "Ember", "Mithril", "Elm"];
const modifiers = ["ImmutableJS", "ES6", "Redux", "FalcorJS", "Server Side Generated"];
const buildTool = ["Gulp","Grunt","Ember-CLI","Yeoman","Lineman","bespoke build pipeline"];
const mobile = ["Ionic","Titanium","React-Native","Pure Android","Native iOS"];
const api = ["HAPI","NodeJS","Rails-API","Elixir/Phoenix","GO"];
const deployedTo = ["Heroku","Amazon EC2","Amazon NoServer","Digital Ocean","GitHub Pages","Surge"];
