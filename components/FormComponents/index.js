import React, { Component } from 'react';
import DatePicker from 'react-datepicker';

import { Input } from 'reactstrap';

export const FormDatePicker = (props) => (
    <DatePicker
        className="form-control"
        selected={props.input.value || null}
        onChange={props.input.onChange}
        showTimeSelect={props.showTimeSelect}
        dateFormat={props.showTimeSelect ? 'd/MM/YYYY, HH:00' : 'DD/MM/YYYY'}
        timeFormat={props.showTimeSelect ? 'HH:mm' : null}
        timeIntervals={props.timeIntervals || 60}
        minDate={props.minDate}
        maxDate={props.maxDate}
        minTime={props.minTime}
        maxTime={props.maxTime}
    />
);

export const FormCheckbox = ({ input }) => (<Input {...input} type="checkbox" />);

export const FormInput = ({ input, disabled, className }) => (
    <Input {...input}
        disabled={disabled}
        className={className || ''}
        autoComplete="off" />);