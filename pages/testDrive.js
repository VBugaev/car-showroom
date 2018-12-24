import React, { Component } from 'react';
import Router from 'next/router';
import fetch from 'unfetch';

import { Container, Row, Col, Form, FormGroup, Input, Button, Label } from 'reactstrap';

import Layout from '../components/Layout';

import TestDriveForm from '../components/Forms/testDriveForm';

import Spinner from '../components/Spinner';

class TestDrivePage extends Component {
    static async getInitialProps(context) {
        const { query } = context;
        return { query };
    }
    constructor(props) {
        super(props);
        this.state = {
            isLoading: true
        };
    }

    testDriveSubmit = values => {
        const { query } = this.props;
        console.log(values);
        fetch(`http://localhost:3000/api/testdrive`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                userid: query.userid,
                autoid: query.autoid,
                date: values.date
            })
        }).then(r => {
            Router.push('/');
        })
            .catch(err => {
                console.log(err);
            })
        console.log(values.date);

    }

    render() {
        const { query, isLoading } = this.props;
        return isLoading ? (
            <Container className="page-wrapper d-flex">
                <Spinner isLoading={isLoading} />
            </Container>
        ) : (
                <Layout title="Create order">
                    <Container>
                        <Row>
                            <Col sm="12" className="d-flex justify-content-center">
                                <h1 className="display-4 align-middle text-center mb-5">Go on test-drive <span className="text-bold">{query.autoname}</span>!</h1>
                            </Col>
                        </Row>
                        <Row>
                            <Col sm="12">
                                <TestDriveForm onSubmit={this.testDriveSubmit} />
                            </Col>
                        </Row>
                    </Container>
                </Layout>);
    }
}

export default TestDrivePage;