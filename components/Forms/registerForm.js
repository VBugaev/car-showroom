import React from 'react';
import { FormGroup, Button, Label, Input } from 'reactstrap';
import Link from 'next/link';
import { Field, reduxForm, formValueSelector } from 'redux-form';
import { FormInput, FormCheckbox } from '../FormComponents';
import { connect } from 'react-redux';
import { required, maxLength, letters, phoneNumber } from './validators.js';

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
        const { input, meta } = this.props;
        return (<>
            <Input type="select" name="select" id="streetsSelect" {...input}>
                <option>Select Street</option>
                {streets.map(street => <option key={street.id} value={street.id}>{street.name}</option>)}
            </Input>
            {meta.touched && ((meta.error && <span className="text-danger">{meta.error}</span>) ||
                (meta.warning && <span>{meta.warning}</span>))}
        </>
        );
    }
}

class RegisterForm extends React.Component {
    render() {
        const { props } = this;
        return (
            <form onSubmit={props.handleSubmit} action="POST">
                <FormGroup>
                    <Field validate={[required, maxLength(50), letters]} name="name" component={FormInput} type="text" placeholder="Enter name" />
                </FormGroup>
                <FormGroup>
                    <Field validate={[required, maxLength(50), letters]} name="surname" component={FormInput} type="text" placeholder="Enter surname" />
                </FormGroup>
                <FormGroup>
                    <Field validate={[required, phoneNumber]} name="phone" component={FormInput} type="phone" placeholder="Enter phone" />
                </FormGroup>
                <FormGroup>
                    <Field validate={required} name="password" component={FormInput} type="password" placeholder="Enter password" />
                </FormGroup>
                <FormGroup>
                    <Field validate={required} name="street" component={StreetsSelect} />
                </FormGroup>
                {props.hasStreet && <FormGroup check className="mb-5">
                    <Label check>
                        <Field name="isDelivery" component={FormCheckbox} />{' '}
                        Has delivery?
                    </Label>
                </FormGroup>}
                <Button disabled={props.submitting} outline color="primary" size="lg" block>Sign up</Button>
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