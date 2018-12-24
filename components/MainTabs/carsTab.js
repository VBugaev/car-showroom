import React, { Component } from 'react';
import {
    InputGroup,
    InputGroupAddon,
    TabPane,
    Card,
    Button,
    CardTitle,
    CardText,
    Row,
    Col
} from 'reactstrap';
import './tabs.css';
import fetch from 'unfetch';
import Spinner from '../Spinner';
import Link from 'next/link';

class CarsTab extends Component {
    constructor(props) {
        super(props);
        this.state = {
            isLoading: true,
            cars: [],
            displayedCars: [],
            searchValue: ''
        }
        this.searchInputRef = React.createRef();
    }

    applyFilterData = (value) => {
        const { cars } = this.state;
        this.setState(() => {
            return { searchValue: value };
        });
        if (value) {
            const displayedCars = cars.filter(car => {
                return `${car.Brand.toUpperCase()} ${car.Model.toUpperCase()}`.includes(value.toUpperCase());
            });
            this.setState({ displayedCars });
        } else {
            this.setState({ displayedCars: cars });
        }
    }

    applyFilterDataOnChange = () => {
        const { searchValue, cars } = this.state;

        if (searchValue) {
            const displayedCars = cars.filter(car => {
                return `${car.Brand.toUpperCase()} ${car.Model.toUpperCase()}`.includes(searchValue.toUpperCase());
            });
            this.setState({ displayedCars });
        } else {
            this.setState({ displayedCars: cars });
        }
    }

    onSearchClick = () => {
        this.applyFilterData(this.searchInputRef.current.value);
    }

    getAutos = () => {
        this.setState({ isLoading: true });
        fetch('api/autos')
            .then(r => r.json())
            .then(data => {
                this.setState({ cars: data });
                this.applyFilterDataOnChange();
                this.setState({ isLoading: false });
            });
    }

    deleteAuto = (id) => {
        fetch(`api/autos?id=${id}`, {
            method: 'DELETE'
        })
            .then(() => this.getAutos());
    }

    componentDidMount = () => {
        this.getAutos();
    }


    render() {
        const { props, state } = this;
        const isAdmin = props.userInfo.role === 'Admin';
        const isManager = props.userInfo.role === 'Manager';
        const isUser = props.userInfo.role === 'User';
        return state.isLoading ?
            (<div style={{ position: "absolute", left: 0, right: 0, bottom: 0, top: 0 }}>
                <div style={{ position: "absolute", transform: "(-50%, -50%)", left: "50%", top: "40%" }}>
                    <Spinner isLoading={state.isLoading} />
                </div>
            </div>) :
            (<TabPane tabId={props.tabId} className="tabs-wrapper">
                <Col sm="12">
                    <Row className="item">
                        <InputGroup>
                            <input className="form-control" ref={this.searchInputRef} placeholder="Enter word to search auto by brand" />
                            <InputGroupAddon addonType="append"><Button onClick={this.onSearchClick}>Search</Button></InputGroupAddon>
                        </InputGroup>
                    </Row>
                    <Row>
                        {state.displayedCars.map(elem => {
                            let isAvailableToBuy = elem.WarehouseCount > 1;
                            let isAvailableToTestDrive = elem.WarehouseCount >= 1;
                            let notAvailable = !elem.WarehouseCount;
                            return (
                                <Col sm="12" key={`${elem.Brand}${elem.Model}`}>
                                    <Card body className="item">
                                        <CardTitle>{`${elem.Brand} ${elem.Model}`}</CardTitle>
                                        <CardText>
                                            {isAvailableToBuy && <span className="text-secondary">avalable to buy; </span>}
                                            {isAvailableToTestDrive && <span className="text-secondary">avalable to test-drive; </span>}
                                            {notAvailable && <span className="text-secondary">not available;</span>}
                                        </CardText>
                                        <CardText>
                                            {`Country: ${elem.CountryTitle}; Body type: ${elem.BodyType}; 
                                            Engine type: ${elem.EngineType}; Places count: ${elem.PlacesCount}; 
                                            Transmission: ${elem.Transmission}; Drive unit: ${elem.DriveUnit};
                                            Air conditioning: ${elem.AirConditioning}; Max speed: ${elem.MaxSpeed}`}</CardText>
                                        <CardText>Price: {`${elem.Price} rubles`}</CardText>
                                        <Row>
                                            {(isUser || isManager) && <Col sm="3">
                                                <Link href={`/order/new?autoid=${elem.Id}&userid=${props.userInfo.id}&autoname=${`${elem.Brand} ${elem.Model}`}`}>
                                                    <Button disabled={!isAvailableToBuy}>Buy</Button>
                                                </Link>
                                            </Col>}
                                            {(isUser || isManager) && <Col sm="3"><Link href={`/testDrive/new?autoid=${elem.Id}&userid=${props.userInfo.id}&autoname=${`${elem.Brand} ${elem.Model}`}`}>
                                                    <Button disabled={notAvailable}>Register on test-drive</Button>
                                                </Link></Col>}
                                            {isAdmin && <Col sm="3"><Button onClick={() => this.deleteAuto(elem.Id)}>Delete car</Button></Col>}
                                        </Row>
                                    </Card>
                                </Col>
                            )
                        })}
                    </Row>
                </Col>
            </TabPane>)
    }
}

export default CarsTab;

