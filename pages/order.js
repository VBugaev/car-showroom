import React, { Component } from 'react';
import Router from 'next/router';
import fetch from 'unfetch';

import { Container, Row, Col, Form, FormGroup, Input, Button, Label } from 'reactstrap';

import Layout from '../components/Layout';

import OrdersForm from '../components/Forms/ordersForm';
import moment from 'moment';

import Spinner from '../components/Spinner';

class OrdersPage extends Component {
    static async getInitialProps(context) {
        const { query } = context;
        return { query };
    }
    constructor(props) {
        super(props);
        this.state = {
            params: {},
            prices: {},
            isLoading: true,
            totalPrice: 0
        };
    }



    componentDidMount = () => {
        fetch(`http://localhost:3000/api/autoparams?id=${this.props.query.autoid}`)
            .then(r => r.json())
            .then(data => {
                this.setState({
                    totalPrice: +data.autoData.Price,
                    params: data.resultParams[0],
                    prices: data.resultPrices[0],
                    isLoading: false
                })
            })
        console.log(this.props);
    }

    orderSubmit = values => {
        const { query } = this.props;
        console.log(values);
        fetch(`http://localhost:3000/api/order`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                ...values,
                userid: query.userid,
                autoid: query.autoid,
                totalPrice: sessionStorage.getItem('price')
            })
        }).then(r => {
            sessionStorage.clear();
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
                                <h1 className="display-4 align-middle text-center mb-5">Create order for <span className="text-bold">{query.autoname}</span></h1>
                            </Col>
                        </Row>
                        <Row>
                            <Col sm="12">
                                <OrdersForm onPriceChange={this.onPriceChange}
                                    onSubmit={this.orderSubmit}
                                    params={this.state.params}
                                    prices={this.state.prices}
                                    totalPrice={this.state.totalPrice} />
                            </Col>
                        </Row>
                    </Container>
                </Layout>);
    }
}

export default OrdersPage;