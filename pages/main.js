import React from 'react';
import { Row, Col, Card, Button, CardTitle, CardText } from 'reactstrap';

import Layout from '../components/Layout'
import Tabs from '../components/Tabs'
import '../pageStyles/main.css'

export default class extends React.Component {
    componentDidMount() {
        localStorage.setItem('user', 'vasya');
    }
    render() {
        return (
            <Layout title="Main page">
                <Col md="3" className="main-page-section">
                    <Card body>
                      <CardTitle>Admin</CardTitle>
                      <CardText>Vladimir Bugaev</CardText>
                      <CardText> +7 (905) 031 53-34, admin</CardText>
                      <Button className="user-section-btn">Manage clients</Button>
                      <Button className="user-section-btn">Manage orders</Button>
                      <Button className="user-section-btn">Manage test drives</Button>
                      <Button className="user-section-btn">Manage entities</Button>
                    </Card>
                </Col>
                <Col md="9" className="main-page-section">
                    <Tabs />
                </Col>
            </Layout>
        );
    }
}