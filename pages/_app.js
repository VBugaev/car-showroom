import App, {Container} from 'next/app'
import Head from 'next/head'
import React from 'react'
import withReduxStore from '../lib/with-redux-store'
import { Provider } from 'react-redux'

import '../node_modules/bootstrap/dist/css/bootstrap.min.css'
import '../pageStyles/index.css'


class MyApp extends App {
  render () {
    const {Component, pageProps, reduxStore} = this.props
    return (
      <Container>
        <Provider store={reduxStore}>
          <Component {...pageProps} />
        </Provider>
      </Container>
    )
  }
}

export default withReduxStore(MyApp)