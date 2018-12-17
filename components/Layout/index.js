import { Container, Row } from 'reactstrap';
import Header from '../Header'

const Layout = (props) => (
  <Container fluid className="page-wrapper inner-page-wrapper">
  <Header title={props.title} />
  <Row className="inner-page-content">
      {props.children}
  </Row>
</Container>
)

export default Layout