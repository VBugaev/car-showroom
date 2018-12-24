import React from 'react';
import { FormGroup, Button } from 'reactstrap';
import Link from 'next/link';
import { Field, reduxForm } from 'redux-form';
import { FormInput } from '../FormComponents';
import { required, maxLength } from './validators.js';

const LoginForm = (props) => {
    return (
        <form onSubmit={props.handleSubmit} action="POST">
            <FormGroup>
                <Field validate={[required, maxLength(20)]} name="phone" component={FormInput} type="phone" placeholder="Enter phone" />
            </FormGroup>
            <FormGroup>
                <Field validate={required} name="password" component={FormInput} type="password" placeholder="Enter password"  />
            </FormGroup>
            <Button disabled={props.submitting} outline color="primary" size="lg" block>Sign in</Button>
            <Link href="/register">
                <a className="btn btn-outline-success btn-lg btn-block">Sign up</a>
            </Link>
        </form>
    );
};

export default reduxForm({
    form: 'login'
})(LoginForm);