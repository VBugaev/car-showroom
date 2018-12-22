import React from 'react';
import { FormGroup, Button, Label } from 'reactstrap';
import Link from 'next/link';
import { Field, reduxForm } from 'redux-form';
import { FormInput, FormCheckbox } from '../FormComponents';

const RegisterForm = (props) => {
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
            <FormGroup check className="mb-5">
                <Label check>
                    <Field name="isDelivery" component={FormCheckbox} />{' '}
                    Has delivery?
                </Label>
            </FormGroup>
            <Button outline color="primary" size="lg" block>Sign up</Button>
            <Link href="/">
                <a className="btn btn-outline-secondary btn-lg btn-block">Go back</a>
            </Link>
        </form>
    );
};

export default reduxForm({
    form: 'register'
})(RegisterForm);