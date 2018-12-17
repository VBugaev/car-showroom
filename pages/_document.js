import Document, { Head, Main, NextScript } from 'next/document';

export default class MyDocument extends Document {
    static async getInitialProps(ctx) {
      const initialProps = await Document.getInitialProps(ctx)
      return { ...initialProps }
    }
  
    render() {
      return (
        <html>
          <Head>
          <meta charSet="utf-8" />
		  <meta name="viewport" content="initial-scale=1.0, width=device-width" />
          <title>Car showroom app</title>
		  <link rel="shortcut icon" type="image/x-icon" href="../favicon.ico" />
          </Head>
          <body className="custom_class">
            <Main />
            <NextScript />
          </body>
        </html>
      )
    }
  }