import React, { Component } from 'react';
import DatePicker from 'react-datepicker';

import { Input } from 'reactstrap';

export const FormDatePicker = (props) => (<>
    <DatePicker
        className="form-control"
        selected={props.input && (props.input.value || null)}
        onChange={props.input && props.input.onChange}
        showTimeSelect={props.showTimeSelect}
        dateFormat={props.showTimeSelect ? 'd/MM/YYYY, HH:00' : 'DD/MM/YYYY'}
        timeFormat={props.showTimeSelect ? 'HH:mm' : null}
        timeIntervals={props.timeIntervals || 60}
        minDate={props.minDate}
        maxDate={props.maxDate}
        minTime={props.minTime}
        maxTime={props.maxTime}
        placeholder={props.placeholder}
    />
    { props.meta.touched && ((props.meta.error && <span className="text-danger">{props.meta.error}</span>) || 
    (props.meta.warning && <span>{props.meta.warning}</span>)) }
</>);

export const FormCheckbox = ({ input, meta: { touched, error, warning } }) => (<>
<Input {...input} type="checkbox" />
{ touched && ((error && <span className="text-danger">{error}</span>) || (warning && <span>{warning}</span>)) }
</>);

export const FormInput = ({ input, disabled, className, placeholder, type,
    meta: { touched, error, warning } }) => (<>
    <Input {...input}
        disabled={disabled}
        placeholder={placeholder || ''}
        className={className || ''}
        type={type || 'text'}
        autoComplete="off" />
        { touched && ((error && <span className="text-danger">{error}</span>) || (warning && <span>{warning}</span>)) }
        </>);