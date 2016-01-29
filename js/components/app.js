import DOM from 'react-dom'
import React, {Component} from 'react'
import StackSelectionContainer from '../containers/stack-selection-container'


class App extends React.Component {

  constructor (props) {
    super(props)

  }

  render(){
    return (
        <div className="app">
          <StackSelectionContainer  {...this.props}/>
        </div>
    );
  }
}

module.exports = App;
