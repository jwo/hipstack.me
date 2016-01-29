import {List, Map, fromJS} from 'immutable';

function setNewStack(state, newStack){
  return state.set('stack', newStack);
}

export default function(state = Map(), action){
  switch(action.type){
    case 'RECEIVE_NEW_STACK':
      return setNewStack(state, action.stack);
  }
  return state;
}
