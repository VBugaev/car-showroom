import React from 'react';
import { FormGroup, Button, Label } from 'reactstrap';
import Link from 'next/link';
import { Field, reduxForm } from 'redux-form';
import { FormCheckbox, FormDatePicker } from '../FormComponents';

const OrderForm = (props) => {
    return (
        <form onSubmit={props.handleSubmit} action="POST">
            <FormGroup>
                <Field name="date" component={FormDatePicker} type="text" placeholder="Choose date for taking order" />
            </FormGroup>
            <FormGroup className="mb-5">
                <h5>Additional parameters for current model:</h5>
                {props.params && Object.keys(props.params).map(el => {
                    switch (el) {
                        case 'WindowRaisers': return (props.params[el] &&
                            <FormGroup check>
                                <Label check>
                                    <Field name="windowRaisers" component={FormCheckbox} />{' '}
                                    Add window raisers: {props.params[el]}, +{props.prices[el]} rubles to total price
                            </Label>
                            </FormGroup>
                        );
                        case 'CabinMaterial': return (props.params[el] &&
                            <FormGroup check>
                                <Label check>
                                    <Field name="cabinMaterial" component={FormCheckbox} />{' '}
                                    Add emproved cabin material, +{props.prices[el]} rubles to total price
                            </Label>
                            </FormGroup>
                        );
                        case 'HeatedSteeringWheel': return (props.params[el] &&
                            <FormGroup check>
                                <Label check>
                                    <Field name="heatedSteeringWheel" component={FormCheckbox} />{' '}
                                    Add heated steering wheel, +{props.prices[el]} rubles to total price
                            </Label>
                            </FormGroup>
                        );
                        case 'ParkingSensors': return (props.params[el] &&
                            <FormGroup check>
                                <Label check>
                                    <Field name="parkingSensors" component={FormCheckbox} />{' '}
                                    Add parking sensors, +{props.prices[el]} rubles to total price
                            </Label>
                            </FormGroup>
                        );
                        case 'RearViewCamera': return (props.params[el] &&
                            <FormGroup check>
                                <Label check>
                                    <Field name="rearViewCamera" component={FormCheckbox} />{' '}
                                    Add rear view camera, +{props.prices[el]} rubles to total price
                            </Label>
                            </FormGroup>
                        );
                        case 'WheelDisks': return (props.params[el] &&
                            <FormGroup check>
                                <Label check>
                                    <Field name="wheelDisks" component={FormCheckbox} />{' '}
                                    Add wheel disks, +{props.prices[el]} rubles to total price
                            </Label>
                            </FormGroup>
                        );
                        case 'AdaptiveHeadlights': return (props.params[el] &&
                            <FormGroup check className="mb-5">
                                <Label check>
                                    <Field name="adaptiveHeadlights" component={FormCheckbox} />{' '}
                                    Add adaptive headlights, +{props.prices[el]} rubles to total price
                            </Label>
                            </FormGroup>
                        );
                        default:
                            return null;
                    }
                })}
            </FormGroup>
            <Button outline color="primary" size="lg" block>Buy a car</Button>
            <Link href="/">
                <a className="btn btn-outline-secondary btn-lg btn-block">Go back</a>
            </Link>
        </form>
    );
};

export default reduxForm({
    form: 'order'
})(OrderForm);