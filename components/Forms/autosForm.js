import React, { Component } from 'react';
import { Field, reduxForm } from 'redux-form';
import moment from 'moment';

import { FormGroup, Button, Label, Input } from 'reactstrap';

import { FormDatePicker, FormInput, FormCheckbox } from '../FormComponents';

const DatePickerWithTime = (props) => {
    const startDate = moment(Date.now());
    const endDate = startDate.clone().add(30, 'd');
    const parsedStartDate = startDate.toDate();
    const parsedEndDate = endDate.toDate();
    const startTime = new Date;
    const endTime = new Date;
    startTime.setHours(startDate.hour());
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
    const { handleSubmit } = props;
    return (
        <form method="POST" onSubmit={handleSubmit}>
            <h1 className="display-4 mb-4">Create essential auto data:</h1>
            <FormGroup>
                <Label>Brand</Label>
                <Field name="brand" component={FormInput} type="text" />
            </FormGroup>
            <FormGroup>
                <Label className="mr-5">Date</Label>
                <Field name="date" component={DatePickerWithTime} type="text" />
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
            <Button className="user-section-btn">Create auto</Button>
        </form>
    );
};

export default reduxForm({
    form: 'autos'
})(AutosForm);