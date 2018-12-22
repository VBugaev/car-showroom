import React from 'react';
import { Container, Row, Col, Card, Button, CardTitle, CardText } from 'reactstrap';

import Router from 'next/router';
import Spinner from '../components/Spinner';
import Layout from '../components/Layout'
import Tabs from '../components/Tabs'
import '../pageStyles/main.css'

export default class extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            isLoading: true,
            id: '',
            name: '',
            surname: '',
            patronymic: '',
            phone: '',
            isDelivery: false,
            role: '',
            street: ''
        }
    }
    componentDidMount() {
        this.setState({
            id: localStorage.getItem('id'),
            name: localStorage.getItem('name'),
            surname: localStorage.getItem('surname'),
            patronymic: localStorage.getItem('patronymic'),
            phone: localStorage.getItem('phone'),
            isDelivery: localStorage.getItem('deliveryType'),
            role: localStorage.getItem('role'),
            street: localStorage.getItem('street'),
            isLoading: false
        });
    }

    render() {
        const { name, surname, phone, isDelivery, role, street, isLoading } = this.state;
        const isAdmin = role === 'Admin';
        const isManager = role === 'Manager';
        const isUser = role === 'User';
        const userInfo = {
            name, surname, phone, isDelivery, role, street
        };
        return isLoading ? (
            <Container className="page-wrapper d-flex">
                <Spinner isLoading={isLoading} />
            </Container>
        ) : (
            <Layout title="Main page">
                <Col md="3" className="main-page-section">
                    <Card body>
                        <CardTitle>
                        {isAdmin && 'Hello, Admin!' }
                        {isManager && 'Hello, Manager!' }
                        {isUser && 'Greetings, Client!' }
                        </CardTitle>
                        <CardText>{`${name} ${surname}`}</CardText>
                        <CardText> {`${phone}, ${role}`}</CardText>
                        <CardText> Delivery: {isDelivery ? ' Yes': ' No'}</CardText>
                        { street.trim() && (<CardText>Address: {street}</CardText>)}
                        {isAdmin && (<><Button className="user-section-btn">Manage clients</Button>
                            <Button className="user-section-btn">Manage orders</Button>
                            <Button className="user-section-btn">Manage test drives</Button>
                            <Button className="user-section-btn" onClick={() => Router.push('/entities')}>
                                Manage entities
                        </Button></>)}
                    </Card>
                </Col>
                <Col md="9" className="main-page-section" style={{ display: "flex" }}>
                    <Tabs userInfo={userInfo} />
                </Col>
            </Layout>
        );
    }
}