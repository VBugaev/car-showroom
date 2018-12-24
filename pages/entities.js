import React, { Component } from 'react';
import fetch from 'unfetch';

import { Container, Row, Col, Form, FormGroup, Input, Button, Label } from 'reactstrap';

import Layout from '../components/Layout';
import Router from 'next/router';

import AutosForm from '../components/Forms/autosForm';


class EntitiesPage extends Component {
    constructor(props) {
        super(props);
        
    }
    autosSubmit = values => {
        fetch('api/autos', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(values)
        }).then( r => r.json())
          .then(data => Router.push('/'))
          .catch(err => {
              console.log(err);
          })
        console.log(values);
    }

    render() {
        return (
            <Layout title="Create page">
                <Container>
                    <Row>
                        <Col sm="12" className="d-flex justify-content-center">
                            <AutosForm onSubmit={this.autosSubmit} />
                        </Col>
                    </Row>
                </Container>
            </Layout>);
    }
}

export default EntitiesPage;