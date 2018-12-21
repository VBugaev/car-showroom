import React, { Component } from 'react';
import { Field, reduxForm, formValueSelector } from 'redux-form';
import moment from 'moment';
import { connect } from 'react-redux';

import { FormGroup, Button, Label, Input, Col } from 'reactstrap';

import { FormDatePicker, FormInput, FormCheckbox } from '../FormComponents';

const DatePickerWithTime = (props) => {
    const startDate = moment(Date.now()).add(1, 'd');
    const endDate = startDate.clone().add(30, 'd');
    const parsedStartDate = startDate.toDate();
    const parsedEndDate = endDate.toDate();
    const startTime = new Date;
    const endTime = new Date;
    startTime.setHours(10);
    endTime.setHours(20);
    return (<FormDatePicker
        showTimeSelect
        minDate={parsedStartDate}
        maxDate={parsedEndDate}
        minTime={startTime}
        maxTime={endTime}
        {...props}
    />);
}

class CountriesSelect extends Component {
    constructor(props) {
        super(props);
        this.state = {
            countries: []
        };
    }

    componentDidMount() {
        fetch('api/countries')
            .then(r => r.json())
            .then(data => {
                this.setState({ countries: data })
            })
    }

    render() {
        const { countries } = this.state;
        const { input } = this.props;
        return (
            <Input type="select" name="select" id="countriesSelect" {...input}>
                <option>Select country</option>
                {countries.map(country => <option key={country.Id} value={country.Id}>{country.Title}</option>)}
            </Input>
        );
    }
}

const AutosForm = props => {
    const { handleSubmit, 
        windowRaisers,
        cabinMaterial,
        hasAdaptiveHeadlights,
        wheelDisks,
        hasHeatedSteeringWheel,
        hasRearViewCamera,
        hasParkingSensors } = props;

    return (
        <form method="POST" onSubmit={handleSubmit}>
            <h1 className="display-4 mb-4 mt-4">Create essential auto data</h1>
            <FormGroup>
                <Label>Brand</Label>
                <Field name="brand" component={FormInput} type="text" />
            </FormGroup>
            <FormGroup>
                <Label>Model</Label>
                <Field name="model" component={FormInput} />
            </FormGroup>
            <FormGroup>
                <Label>Country</Label>
                <Field name="country" component={CountriesSelect} />
            </FormGroup>
            <FormGroup>
                <Label>Price</Label>
                <Field name="price" component={FormInput} />
            </FormGroup>
            <FormGroup>
                <Label>Warehouse count</Label>
                <Field name="warehouseCount" component={FormInput} />
            </FormGroup>
            <FormGroup>
                <Label>Body type</Label>
                <Field name="bodyType" component={FormInput} />
            </FormGroup>
            <FormGroup>
                <Label>Engine type</Label>
                <Field name="engineType" component={FormInput} />
            </FormGroup>
            <FormGroup>
                <Label>Places count</Label>
                <Field name="placesCount" component={FormInput} />
            </FormGroup>
            <FormGroup>
                <Label>Air conditioning</Label>
                <Field name="airConditioning" component={FormInput} />
            </FormGroup>
            <FormGroup>
                <Label>Drive unit</Label>
                <Field name="driveUnit" component={FormInput} />
            </FormGroup>
            <FormGroup>
                <Label>Transmission</Label>
                <Field name="transmission" component={FormInput} />
            </FormGroup>
            <FormGroup>
                <Label>Max speed</Label>
                <Field name="maxSpeed" component={FormInput} />
            </FormGroup>
            <h5>Create additional params and prices</h5>
            <FormGroup style={{ marginBottom: '10px' }} row>
                <Label sm={3}>
                    Window raisers
                </Label>               
                <Col sm={4}>
                    <Field name="windowRaisers" component={FormInput} />
                </Col>
                <Col sm={1}>
                    Price
                </Col>
                <Col sm={2}>
                    <Field name="windowRaisersPrice" component={FormInput}
                     disabled={!windowRaisers} />
                </Col>
            </FormGroup>
            <FormGroup check row>
                <Label check sm={4}>
                    <Field name="hasParkingSensors" component={FormCheckbox} />{' '}
                    Parking sensors
                </Label>
                <Col sm={5}>
                    <Field name="parkingSensorsPrice" component={FormInput} disabled={!hasParkingSensors} />
                </Col>
            </FormGroup>
            <FormGroup check row>
                <Label check sm={4}>
                    <Field name="hasRearViewCamera" component={FormCheckbox} />{' '}
                    Rear-view camera
                </Label>
                <Col sm={5}>
                    <Field name="rearViewCameraPrice" component={FormInput} disabled={!hasRearViewCamera} />
                </Col>
            </FormGroup>
            <FormGroup  style={{ marginBottom: '10px' }} check row>
                <Label check sm={4}>
                    <Field name="hasHeatedSteeringWheel" component={FormCheckbox} />{' '}
                    Heated steering wheel
                </Label>
                <Col sm={5}>
                    <Field name="heatedSteeringWheelPrice" component={FormInput} disabled={!hasHeatedSteeringWheel} />
                </Col>
            </FormGroup>
            <FormGroup style={{ marginBottom: '10px' }} row>
                <Label sm={3}>
                    Wheel disks
                </Label>               
                <Col sm={4}>
                    <Field name="wheelDisks" component={FormInput} />
                </Col>
                <Col sm={1}>
                    Price
                </Col>
                <Col sm={2}>
                    <Field name="wheelDisksPrice" component={FormInput}
                     disabled={!wheelDisks} />
                </Col>
            </FormGroup>
            <FormGroup style={{ marginBottom: '10px' }} check row>
                <Label check sm={4}>
                    <Field name="hasAdaptiveHeadlights" component={FormCheckbox} />{' '}
                    Adaptive Headlights
                </Label>
                <Col sm={5}>
                    <Field name="adaptiveHeadlightsPrice" component={FormInput} disabled={!hasAdaptiveHeadlights} />
                </Col>
            </FormGroup>
            <FormGroup className="mb-5" row>
                <Label sm={3}>
                    Cabin material
                </Label>               
                <Col sm={4}>
                    <Field name="cabinMaterial" component={FormInput} />
                </Col>
                <Col sm={1}>
                    Price
                </Col>
                <Col sm={2}>
                    <Field name="cabinMaterialPrice" component={FormInput}
                     disabled={!cabinMaterial} />
                </Col>
            </FormGroup> 
            <Button className="user-section-btn mb-5">Create auto</Button>
        </form>
    );
};

const ReduxAutosForm = reduxForm({
    form: 'autos'
})(AutosForm);

const selector = formValueSelector('autos');

export default connect(
    state => ({
        windowRaisers: selector(state, 'windowRaisers'),
        cabinMaterial: selector(state, 'cabinMaterial'),
        hasAdaptiveHeadlights: selector(state, 'hasAdaptiveHeadlights'),
        wheelDisks: selector(state, 'wheelDisks'),
        hasHeatedSteeringWheel: selector(state, 'hasHeatedSteeringWheel'),
        hasRearViewCamera: selector(state, 'hasRearViewCamera'),
        hasParkingSensors: selector(state, 'hasParkingSensors')
    })
)(ReduxAutosForm);

