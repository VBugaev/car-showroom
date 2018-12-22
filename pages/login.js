import React, { Component } from 'react';
import { Container, Row, Col, Alert } from 'reactstrap';
import Link from 'next/link';
import Router from 'next/router';

import Spinner from '../components/Spinner';

import '../pageStyles/login.css';

import LoginForm from '../components/Forms/loginForm';


export default class extends Component {
    static getInitialProps({ res }) {
        return { isLoading: true };
    }

    constructor(props) {
        super(props);
        this.state = {
            isLoading: true,
            error: ''
        }
    }

    loginSubmit = values => {
        fetch('api/login', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(values)
        }).then(r => r.json())
            .then(data => {
                if (data.Id) {
                    localStorage.clear();
                    localStorage.setItem('id', data.Id);
                    localStorage.setItem('name', data.Name || ' ');
                    localStorage.setItem('surname', data.Surname || ' ');
                    localStorage.setItem('patronymic', data.Patronymic || ' ');
                    localStorage.setItem('phone', data.Phone);
                    localStorage.setItem('deliveryType', data.DeliveryType);
                    localStorage.setItem('role', data.RoleTitle);
                    localStorage.setItem('street', data.StreetTitle || ' ');
                    this.setState({ error: '' });
                    Router.push('/');
                } else {
                    this.setState({ error: data.error });
                }
            })
    }

    componentDidMount() {
        if (localStorage.getItem('id')) {
            window.location.replace('/main');
        } else {
            this.setState({ isLoading: false });
        }
    }

    render() {
        const { isLoading, error } = this.state;

        return isLoading ? (
            <Container className="page-wrapper d-flex">
                <Spinner isLoading={isLoading} />
            </Container>
        ) : (<Container className="page-wrapper">
            <Row className="login-form-wrapper">
                <Col className="d-flex flex-column justify-content-center" sm="12" md={{ size: 4, offset: 4 }}>
                    <h1 className="display-4 align-middle text-center mb-5">Car showroom</h1>
                    {
                        error && <Alert color="danger">{error}</Alert>
                    }
                    <LoginForm onSubmit={this.loginSubmit} />
                </Col>
            </Row>
        </Container>);
    }
}