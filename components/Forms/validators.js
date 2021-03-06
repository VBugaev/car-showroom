import moment from 'moment';

export const required = value => (value || typeof value === 'number' ? undefined : 'Required')
export const maxLength = max => value => value && value.length > max ? `Must be ${max} characters or less` : undefined
export const minLength = min => value => value && value.length < min ? `Must be ${min} characters or more` : undefined
export const number = value => value && isNaN(Number(value)) ? 'Must be a number' : undefined
export const letters = value => value && !/[a-zA-ZА-Яа-я ]+/g.test(value) ? 'Only letters allowed' : undefined
export const minValue = min => value => value && value < min ? `Must be at least ${min}` : undefined
export const email = value =>
  value && !/^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i.test(value)
    ? 'Invalid email address'
    : undefined
export const isValidDate = value => value && moment(value).toDate > Date.now() ? 'Date in past, please insert correct date' : undefined;
export const phoneNumber = value =>
  value && !/^((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$/i.test(value)
    ? 'Invalid phone number'
    : undefined
