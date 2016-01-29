import React, {Component} from 'react'
import StackSelection from '../components/stack-selection';
import {connect} from 'react-redux'


class AppContainer extends React.Component {
  constructor(props) {
    super(props)
  }

  render() {
    return (
      <StackSelection {...this.props} />
    )
  }
}


function mapStateToProps(state) {
  return {
    stack: state.get('stack')
  };
}

export default connect(mapStateToProps)(AppContainer)
