import React from 'react';
import { FormGroup, Button } from 'reactstrap';
import Link from 'next/link';
import { Field, reduxForm } from 'redux-form';
import { FormInput } from '../FormComponents';

const LoginForm = (props) => {
    return (
        <form onSubmit={props.handleSubmit} action="POST">
            <FormGroup>
                <Field name="phone" component={FormInput} type="phone" placeholder="Enter phone" />
            </FormGroup>
            <FormGroup>
                <Field name="password" component={FormInput} type="password" placeholder="Enter password"  />
            </FormGroup>
            <Button outline color="primary" size="lg" block>Sign in</Button>
            <Link href="/register">
                <a className="btn btn-outline-success btn-lg btn-block">Sign up</a>
            </Link>
        </form>
    );
};

export default reduxForm({
    form: 'login'
})(LoginForm);