import React, { Component } from 'react';
import fetch from 'unfetch';

import { Container, Row, Col, Form, FormGroup, Input, Button, Label } from 'reactstrap';

import Layout from '../components/Layout';

import OrdersForm from '../components/Forms/ordersForm';

import Spinner from '../components/Spinner';

class OrdersPage extends Component {
    static async getInitialProps(context) {
        const { query } = context;
        console.log(query);
        return { query };
    }
    constructor(props) {
        super(props);
        this.state = {
            params: [],
            prices: [],
            isLoading: true,
            totalPrice: 0
        };
    }

    componentDidMount = () => {
        fetch(`http://localhost:3000/api/autoparams?id=${this.props.query.autoid}`)
            .then(r => r.json())
            .then(data => {
                console.log(data);
                this.setState({
                    totalPrice: +data.autoData.price,
                    params: data.resultParams[0],
                    prices: data.resultPrices[0],
                    isLoading: false
                })
            })
    }

    // orderSubmit = values => {
    //     fetch('api/autos', {
    //         method: 'POST',
    //         headers: {
    //             'Content-Type': 'application/json'
    //         },
    //         body: JSON.stringify(values)
    //     }).then( r => {
    //         console.log('success!');
    //       })
    //     console.log(values);
    // }

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
                                <h1 className="display-4 align-middle text-center mb-5">Create order for <span className="text-bold">{query.autoname}</span></h1>
                            </Col>
                        </Row>
                        <Row>
                            <Col sm="12">
                                <OrdersForm params={this.state.params} prices={this.state.prices} />
                            </Col>
                        </Row>
                    </Container>
                </Layout>);
    }
}

export default OrdersPage;