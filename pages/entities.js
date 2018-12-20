import React, { Component } from 'react';
import { Field, reduxForm } from 'redux-form';
import fetch from 'unfetch';

import { Container, Row, Col, Form, FormGroup, Input, Button, Label } from 'reactstrap';

import Layout from '../components/Layout';

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

const FormCheckbox = ({input}) => (<Input {...input} type="checkbox" />); 

const FormInput = (field) => (<Input {...field.input} autoComplete="off"/>);

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

const ReduxAutosForm = reduxForm({
    form: 'autos'
})(AutosForm);

class EntitiesPage extends Component {
    autosSubmit = values => {
        fetch('api/autos', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(values)
        }).then( r => {
            console.log('success!');
          })
        console.log(values);
    }

    render() {
        return (
            <Layout title="Create page">
                <Container>
                    <Row>
                        <Col sm="12" className="d-flex justify-content-center">
                            <ReduxAutosForm onSubmit={this.autosSubmit} />
                        </Col>
                    </Row>
                </Container>
            </Layout>);
    }
}

export default EntitiesPage;