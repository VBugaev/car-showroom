import { 
    Input,
    InputGroup,
    InputGroupAddon,
    TabPane, 
    Nav, 
    NavItem,
    NavLink,
    Card, 
    Button, 
    CardTitle, 
    CardText, 
    Row, 
    Col } from 'reactstrap';
import './tabs.css';


export default (props) => (
            <TabPane tabId={props.tabId} className="tabs-wrapper">
                <Col sm="12">
                  <Row>
                      <h1 className="display-4">Test-drives</h1>
                  </Row>
                </Col>
            </TabPane>
);

