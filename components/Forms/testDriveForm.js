import React from 'react';
import { FormGroup, Button, Label } from 'reactstrap';
import Link from 'next/link';
import { Field, reduxForm } from 'redux-form';
import { FormDatePicker } from '../FormComponents';
import moment from 'moment';

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

class TestDriveForm extends React.Component {
    render() {
        const { props } = this;
        return (
            <form onSubmit={props.handleSubmit} action="POST">
                <FormGroup>
                    <Label style={{ marginRight: '10px' }}>Choose date for test-drive</Label>
                    <Field name="date" component={DatePickerWithTime} type="text" />
                </FormGroup>
                <Button outline color="primary" size="lg" block>Register test-drive</Button>
                <Link href="/">
                    <a className="btn btn-outline-secondary btn-lg btn-block">Go back</a>
                </Link>
            </form>
        );
    }
}

export default reduxForm({
    form: 'testDrive'
})(TestDriveForm);