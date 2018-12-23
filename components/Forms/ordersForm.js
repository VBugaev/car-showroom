import React from 'react';
import { FormGroup, Button, Label, Row, Col } from 'reactstrap';
import Link from 'next/link';
import { Field, reduxForm, formValueSelector } from 'redux-form';
import { FormCheckbox, FormDatePicker } from '../FormComponents';
import moment from 'moment';
import { connect } from 'react-redux';

const DatePickerWithTime = (props) => {
    const startDate = moment(Date.now()).add(1, 'd');
    const endDate = startDate.clone().add(365, 'd');
    const parsedStartDate = startDate.toDate();
    const parsedEndDate = endDate.toDate();
    return (<FormDatePicker
        showTimeSelect
        minDate={parsedStartDate}
        maxDate={parsedEndDate}
        {...props}
    />);
}

class OrderForm extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            price: 0
        };
    }

    static getDerivedStateFromProps(props, state) {
        const { totalPrice,
            windowRaisers,
            cabinMaterial,
            adaptiveHeadlights,
            wheelDisks,
            heatedSteeringWheel,
            rearViewCamera,
            parkingSensors,
            params,
            prices,
            onPriceChange } = props;
        let { price } = state;
        price = totalPrice;
        if (windowRaisers) {
            if (params['WindowRaisers']) {
                price += +prices['WindowRaisers'];
            }
        }
        if (cabinMaterial) {
            if (params['CabinMaterial']) {
                price += +prices['CabinMaterial'];
            }
        }
        if (adaptiveHeadlights) {
            if (params['AdaptiveHeadlights']) {
                price += +prices['AdaptiveHeadlights'];
            }
        }
        if (wheelDisks) {
            if (params['WheelDisks']) {
                price += +prices['WheelDisks'];
            }
        }
        if (heatedSteeringWheel) {
            if (params['HeatedSteeringWheel']) {
                price += +prices['HeatedSteeringWheel'];
            }
        }
        if (rearViewCamera) {
            if (params['RearViewCamera']) {
                price += +prices['RearViewCamera'];
            }
        }
        if (parkingSensors) {
            if (params['ParkingSensors']) {
                price += +prices['ParkingSensors'];
            }
        }
        
        return {
            price
        };
    }

    shouldComponentUpdate = (nextProps, nextState) => {
        return nextState.price !== this.state.price;
    }

    componentDidUpdate = (prevProps, prevState) => {
        if (prevState.price !== this.state.price) {
            sessionStorage.setItem('price', this.state.price);
        }
    }
    

    render() {
        const { props } = this;
        return (
            <form onSubmit={props.handleSubmit} action="POST">
                <FormGroup>
                    <Label style={{ marginRight: '10px' }}>Choose date for order purchasing</Label>
                    <Field name="date" component={DatePickerWithTime} type="text" placeholder="Choose date for taking order" />
                </FormGroup>
                <FormGroup style={{ marginBottom: '20px' }}>
                    <h5>Additional parameters for current model:</h5>
                    {props.params && Object.keys(props.params).map(el => {
                        switch (el) {
                            case 'WindowRaisers': return (props.params[el] &&
                                <FormGroup key={el} check>
                                    <Label check>
                                        <Field name="windowRaisers" component={FormCheckbox} />{' '}
                                        Add window raisers: {props.params[el]}, +{+props.prices[el]} rubles to total price
                                </Label>
                                </FormGroup>
                            );
                            case 'CabinMaterial': return (props.params[el] &&
                                <FormGroup key={el} check>
                                    <Label check>
                                        <Field name="cabinMaterial" component={FormCheckbox} />{' '}
                                        Add emproved cabin material: {props.params[el]}, +{+props.prices[el]} rubles to total price
                                </Label>
                                </FormGroup>
                            );
                            case 'HeatedSteeringWheel': return (props.params[el] &&
                                <FormGroup key={el} check>
                                    <Label check>
                                        <Field name="heatedSteeringWheel" component={FormCheckbox} />{' '}
                                        Add heated steering wheel, +{+props.prices[el]} rubles to total price
                                </Label>
                                </FormGroup>
                            );
                            case 'ParkingSensors': return (props.params[el] &&
                                <FormGroup key={el} check>
                                    <Label check>
                                        <Field name="parkingSensors" component={FormCheckbox} />{' '}
                                        Add parking sensors, +{+props.prices[el]} rubles to total price
                                </Label>
                                </FormGroup>
                            );
                            case 'RearViewCamera': return (props.params[el] &&
                                <FormGroup key={el} check>
                                    <Label check>
                                        <Field name="rearViewCamera" component={FormCheckbox} />{' '}
                                        Add rear view camera, +{+props.prices[el]} rubles to total price
                                </Label>
                                </FormGroup>
                            );
                            case 'WheelDisks': return (props.params[el] &&
                                <FormGroup key={el} check>
                                    <Label check>
                                        <Field name="wheelDisks" component={FormCheckbox} />{' '}
                                        Add wheel disks: {props.params[el]}, +{+props.prices[el]} rubles to total price
                                </Label>
                                </FormGroup>
                            );
                            case 'AdaptiveHeadlights': return (props.params[el] &&
                                <FormGroup key={el} check >
                                    <Label check>
                                        <Field name="adaptiveHeadlights" component={FormCheckbox} />{' '}
                                        Add adaptive headlights, +{+props.prices[el]} rubles to total price
                                </Label>
                                </FormGroup>
                            );
                            default:
                                return null;
                        }
                    })}
                </FormGroup>
                <Row style={{ marginBottom: '20px' }}>
                    <Col sm="12">
                        <h5>Basic price for this model: {this.state.price} rubles</h5>
                    </Col>
                </Row>
                <Button outline color="primary" size="lg" block>Buy a car</Button>
                <Link href="/">
                    <a className="btn btn-outline-secondary btn-lg btn-block">Go back</a>
                </Link>
            </form>
        );
    }
}

const ReduxOrderForm = reduxForm({
    form: 'order'
})(OrderForm);

const selector = formValueSelector('order');

export default connect(
    (state, ownProps) => ({
        windowRaisers: selector(state, 'windowRaisers'),
        cabinMaterial: selector(state, 'cabinMaterial'),
        adaptiveHeadlights: selector(state, 'adaptiveHeadlights'),
        wheelDisks: selector(state, 'wheelDisks'),
        heatedSteeringWheel: selector(state, 'heatedSteeringWheel'),
        rearViewCamera: selector(state, 'rearViewCamera'),
        parkingSensors: selector(state, 'parkingSensors'),
        price: ownProps.totalPrice
    })
)(ReduxOrderForm);