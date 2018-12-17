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

const cars = [
    {
        brand: 'Mazda',
        model: 'RX6',
        additionalParams: `Mazda Mazda Mazda
        Mazda Mazda Mazda
        Mazda Mazda Mazda`,
        price: 10000000
    },
    {
        brand: 'Mazda',
        model: 'RX7',
        additionalParams: `Mazda Mazda Mazda
        Mazda Mazda Mazda
        Mazda Mazda Mazda`,
        price: 10000000
    },
    {
        brand: 'Mazda',
        model: 'RX8',
        additionalParams: `Mazda Mazda Mazda
        Mazda Mazda Mazda
        Mazda Mazda Mazda`,
        price: 10000000
    }
];

export default (props) => (
            <TabPane tabId={props.tabId} className="tabs-wrapper">
                <Col sm="12">
                  <Row className="item">
                  <InputGroup>
                    <Input placeholder="Enter word to search auto by brand"/>
                    <InputGroupAddon addonType="append"><Button>Search</Button></InputGroupAddon>
                  </InputGroup>
                  </Row>
                  <Row>
                      {cars.map(elem => (
                      <Col sm="12" key={`${elem.brand}${elem.model}`}>
                          <Card body className="item">
                            <CardTitle>{elem.brand} {elem.model}</CardTitle>
                            <CardText>{elem.additionalParams}</CardText>
                            <CardText>Price: {elem.price}</CardText>
                            <Row>
                                <Col sm="6"><Button block>Buy</Button></Col>
                                <Col sm="6"><Button block>Register on test drive</Button></Col>
                            </Row>
                          </Card>
                      </Col>
                      ))}
                  </Row>
                </Col>
            </TabPane>
);

