import React from 'react';
import { FormGroup, Button, Label, Input } from 'reactstrap';
import Link from 'next/link';
import { Field, reduxForm, formValueSelector } from 'redux-form';
import { FormInput, FormCheckbox } from '../FormComponents';
import { connect } from 'react-redux';

class StreetsSelect extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            streets: []
        };
    }

    componentDidMount() {
        fetch('api/streets')
            .then(r => r.json())
            .then(data => {
                const updatedStreets = data.map(street => ({
                    id: street.Id,
                    name: `${street.Title} ${street.Type}`
                }))
                this.setState({ streets: updatedStreets })
            })
    }

    render() {
        const { streets } = this.state;
        const { input } = this.props;
        return (
            <Input type="select" name="select" id="streetsSelect" {...input}>
                <option>Select Street</option>
                {streets.map(street => <option key={street.id} value={street.id}>{street.name}</option>)}
            </Input>
        );
    }
}

class RegisterForm extends React.Component {
    render () {
        const { props } = this;
        return (
            <form onSubmit={props.handleSubmit} action="POST">
                <FormGroup>
                    <Field name="name" component={FormInput} type="text" placeholder="Enter name" />
                </FormGroup>
                <FormGroup>
                    <Field name="surname" component={FormInput} type="text" placeholder="Enter surname"  />
                </FormGroup>
                <FormGroup>
                    <Field name="phone" component={FormInput} type="phone" placeholder="Enter phone"  />
                </FormGroup>
                <FormGroup>
                    <Field name="password" component={FormInput} type="password" placeholder="Enter password"  />
                </FormGroup>
                <FormGroup>
                    <Field name="street" component={StreetsSelect} />
                </FormGroup>
                { props.hasStreet && <FormGroup check className="mb-5">
                    <Label check>
                        <Field name="isDelivery" component={FormCheckbox} />{' '}
                        Has delivery?
                    </Label>
                </FormGroup>}
                <Button outline color="primary" size="lg" block>Sign up</Button>
                <Link href="/">
                    <a className="btn btn-outline-secondary btn-lg btn-block">Go back</a>
                </Link>
            </form>
        );
    }
}

const ReduxRegisterForm = reduxForm({
    form: 'register'
})(RegisterForm);

const selector = formValueSelector('register');

export default connect(
    state => ({
        hasStreet: selector(state, 'street')
    })
)(ReduxRegisterForm);