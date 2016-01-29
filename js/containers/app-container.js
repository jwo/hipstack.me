import React, {Component} from 'react'
import StackSelectionContainer from './stack-selection-container';
import App from '../components/app';

import {connect} from 'react-redux'


class AppContainer extends React.Component {
  constructor(props) {
    super(props)
  }

  render() {
    return (
      <App {...this.props} />
    )
  }
}


function mapStateToProps(state) {
  return {
  };
}

export default connect(mapStateToProps)(AppContainer)
