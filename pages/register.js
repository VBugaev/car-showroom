import React from 'react';
import Router from 'next/router';
import { Container, Row, Col, Form, FormGroup, Input, Button } from 'reactstrap';
import '../pageStyles/login.css';
import RegisterForm from '../components/Forms/registerForm';


export default class extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            error: ''
        }
    }
    registerSubmit = values => {
        fetch('api/register', {
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
    render() {
        return (
            <Container className="login-page-wrapper">
                <Row className="login-form-wrapper">
                    <Col className="d-flex flex-column justify-content-center" sm="12" md={{ size: 4, offset: 4 }}>
                        <h1 className="display-4 align-middle text-center mb-5">Sign up the client</h1>
                        <RegisterForm onSubmit={this.registerSubmit}/>
                    </Col>
                </Row>
            </Container>
        );
    }
}