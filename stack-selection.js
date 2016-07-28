import DOM from 'react-dom'
import React, {Component} from 'react'
import {selectStack} from '../actions/select-stack'

class StackSelection extends React.Component {

  constructor (props) {
    super(props)
    this._selectStack = this._selectStack.bind(this);
  }

  _selectStack() {
    let {dispatch} = this.props;
    dispatch(selectStack());
  }

  render(){


    return (
      <div className="stack-selection">
      {this.props.stack &&
        <div className="the-stack">
          {this.props.stack}
        </div>

      }
        <button onClick={this._selectStack}>Select you a HipStack!</button>

        <div className="love">
          This app is built with love by @jwo from Sugar Land, TX with React / Redux, pipelined with universal-js-boilerplate, no data-storage required, deployed to GitHub Pages
        </div>
      </div>
    );
  }
}

module.exports = StackSelection;
