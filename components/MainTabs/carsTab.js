import React, { Component } from 'react';
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
import fetch from 'unfetch';
import Spinner from '../Spinner';


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
class CarsTab extends Component {
    constructor(props) {
        super(props);
        this.state = {
            isLoading: true,
            cars: []
        }
    }

    componentDidMount = () => {
      fetch('http://localhost:3000/api/autos')
      .then(r => r.json())
      .then(data => {
          this.setState({cars: data});
          this.setState({isLoading: false});
      });
    }
    
    
    render() {
        const { props, state } = this;
        
        return state.isLoading ? 
        (<div style={{position: "absolute", left: 0, right: 0, bottom: 0, top: 0}}>
            <div style={{ position: "absolute", transform:"(-50%, -50%)", left:"50%", top: "40%" }}>
                <Spinner isLoading={state.isLoading} />
            </div>
        </div>) :
        (<TabPane tabId={props.tabId} className="tabs-wrapper">
        <Col sm="12">
          <Row className="item">
          <InputGroup>
            <Input placeholder="Enter word to search auto by brand"/>
            <InputGroupAddon addonType="append"><Button>Search</Button></InputGroupAddon>
          </InputGroup>
          </Row>
          <Row>
              {state.cars.map(elem => (
              <Col sm="12" key={`${elem.Brand}${elem.Model}`}>
                  <Card body className="item">
                    <CardTitle>{`${elem.Brand} ${elem.Model}`}</CardTitle>
                    <CardText>
                    {`Country: ${elem.CountryTitle}; Body type: ${elem.BodyType}; 
                    Engine type: ${elem.EngineType}; Places count: ${elem.PlacesCount}; 
                    Transmission: ${elem.Transmission}; Drive unit: ${elem.DriveUnit};
                    Air conditioning: ${elem.AirConditioning}; Max speed: ${elem.MaxSpeed}`}</CardText>
                    <CardText>Price: {`${elem.Price} rubles`}</CardText>
                    <Row>
                        <Col sm="6"><Button block>Buy</Button></Col>
                        <Col sm="6"><Button block>Register on test drive</Button></Col>
                    </Row>
                  </Card>
              </Col>
              ))}
          </Row>
        </Col>
    </TabPane>)
    }
}

export default CarsTab;

